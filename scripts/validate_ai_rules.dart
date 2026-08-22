// ignore_for_file: avoid_print
import 'dart:io';

void main(List<String> args) async {
  print('======================================================');
  print('🔍 RUNNING AI PROJECT RULES VALIDATOR (Docs-as-Code)');
  print('======================================================');

  final libDir = Directory('lib');
  if (!libDir.existsSync()) {
    print('❌ Error: Directory "lib" not found.');
    exit(1);
  }

  int totalViolations = 0;

  // 1. Check File Length (< 300 lines)
  print('\n[1/4] Checking file line limits (Max 300 lines)...');
  final lineLimitViolations = checkFileLineLimits(libDir, maxLines: 300);
  if (lineLimitViolations.isEmpty) {
    print('  ✅ All files are within the 300-line limit.');
  } else {
    print(
      '  ❌ Found ${lineLimitViolations.length} file(s) exceeding 300 lines:',
    );
    for (final v in lineLimitViolations) {
      print('     - $v');
    }
    totalViolations += lineLimitViolations.length;
  }

  // 2. Check Clean Architecture Layer Boundaries
  print('\n[2/4] Checking Clean Architecture layer boundaries...');
  final boundaryViolations = checkArchitectureBoundaries(libDir);
  if (boundaryViolations.isEmpty) {
    print('  ✅ No architectural boundary violations detected.');
  } else {
    print('  ❌ Found ${boundaryViolations.length} layer violation(s):');
    for (final v in boundaryViolations) {
      print('     - $v');
    }
    totalViolations += boundaryViolations.length;
  }

  // 3. Check State Naming Conventions
  print('\n[3/4] Checking State class naming conventions (*State)...');
  final stateNamingViolations = checkStateNaming(libDir);
  if (stateNamingViolations.isEmpty) {
    print('  ✅ All Cubit State classes follow the *State naming convention.');
  } else {
    print('  ❌ Found ${stateNamingViolations.length} naming violation(s):');
    for (final v in stateNamingViolations) {
      print('     - $v');
    }
    totalViolations += stateNamingViolations.length;
  }

  // 4. Summary & Exit Code
  print('\n======================================================');
  if (totalViolations == 0) {
    print('🎉 ALL PROJECT RULES PASSED! Ready for commit/PR.');
    print('======================================================');
    exit(0);
  } else {
    print(
      '⚠️ $totalViolations VIOLATION(S) FOUND! Please fix before proceeding.',
    );
    print('======================================================');
    exit(1);
  }
}

List<String> checkFileLineLimits(Directory dir, {int maxLines = 300}) {
  final violations = <String>[];
  final files = dir.listSync(recursive: true).whereType<File>();

  for (final file in files) {
    final path = file.path.replaceAll('\\', '/');
    if (!path.endsWith('.dart')) continue;

    // Ignore generated files
    if (path.contains('.g.dart') ||
        path.contains('.freezed.dart') ||
        path.contains('app_localizations')) {
      continue;
    }

    final lines = file.readAsLinesSync();
    if (lines.length > maxLines) {
      violations.add('${file.path} (${lines.length} lines > $maxLines)');
    }
  }
  return violations;
}

List<String> checkArchitectureBoundaries(Directory dir) {
  final violations = <String>[];
  final files = dir.listSync(recursive: true).whereType<File>();

  for (final file in files) {
    final path = file.path.replaceAll('\\', '/');
    if (!path.endsWith('.dart')) continue;

    // Presentation Layer Boundary Checks
    if (path.contains('/presentation/')) {
      final lines = file.readAsLinesSync();
      for (int i = 0; i < lines.length; i++) {
        final line = lines[i].trim();
        if (line.startsWith('import ') || line.startsWith('import"')) {
          if (line.contains('/data/') ||
              line.contains('package:mobile_template/features/') &&
                  line.contains('/data/')) {
            violations.add(
              '${file.path}:${i + 1} -> Presentation layer cannot import Data layer: $line',
            );
          }
          if (line.contains('package:dio/dio.dart')) {
            violations.add(
              '${file.path}:${i + 1} -> Presentation layer cannot directly import Dio: $line',
            );
          }
        }
      }
    }

    // Domain Layer Boundary Checks
    if (path.contains('/domain/')) {
      final lines = file.readAsLinesSync();
      for (int i = 0; i < lines.length; i++) {
        final line = lines[i].trim();
        if (line.startsWith('import ') || line.startsWith('import"')) {
          if (line.contains('package:flutter/material.dart') ||
              line.contains('package:flutter/widgets.dart') ||
              line.contains('package:flutter/cupertino.dart')) {
            violations.add(
              '${file.path}:${i + 1} -> Domain layer must be Pure Dart (cannot import Flutter UI): $line',
            );
          }
          if (line.contains('package:dio/dio.dart') ||
              line.contains(
                'package:shared_preferences/shared_preferences.dart',
              ) ||
              line.contains('package:hive/hive.dart')) {
            violations.add(
              '${file.path}:${i + 1} -> Domain layer cannot import external storage/network libs: $line',
            );
          }
        }
      }
    }
  }
  return violations;
}

List<String> checkStateNaming(Directory dir) {
  final violations = <String>[];
  final files = dir.listSync(recursive: true).whereType<File>();

  final classRegex = RegExp(
    r'class\s+([A-Za-z0-9_]+)\s*(?:extends|implements|with|\{)',
  );

  for (final file in files) {
    final path = file.path.replaceAll('\\', '/');
    if (!path.endsWith('.dart')) continue;

    // Check files inside cubit folder named *_state.dart
    if (path.contains('/cubit/') && path.endsWith('_state.dart')) {
      final content = file.readAsStringSync();
      final matches = classRegex.allMatches(content);

      for (final match in matches) {
        final className = match.group(1);
        if (className != null && !className.startsWith('_')) {
          if (!className.endsWith('State')) {
            violations.add(
              '${file.path} -> Class "$className" must end with "State"',
            );
          }
        }
      }
    }
  }
  return violations;
}

import 'package:analyzer/dart/ast/ast.dart';

import 'package:{{analyzer_name.snakeCase()}}/src/analyzers/lint_analyzer/models/class_type.dart';

/// Represents a declaration of a class / mixin / extension.
class ScopedClassDeclaration {
  /// Initialize a newly created [ScopedClassDeclaration] with the given [type] and [declaration].
  const ScopedClassDeclaration(this.type, this.declaration);

  /// The type of the declared class entity.
  final ClassType type;

  /// The node that represents a dart code snippet in the AST structure.
  final CompilationUnitMember declaration;

  /// Returns the user defined name.
  String get name {
    final node = declaration;
    String? name;

    if (node is ExtensionDeclaration) {
      name = node.name?.lexeme;
    } else if (node is NamedCompilationUnitMember) {
      name = node.name.lexeme;
    }

    return name ?? '';
  }
}

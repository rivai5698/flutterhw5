class Point{
  final int row;
  final int column;

  Point(this.row, this.column);

  @override
  String toString() {
    return 'Point{column: $row, row: $column}';
  }
}
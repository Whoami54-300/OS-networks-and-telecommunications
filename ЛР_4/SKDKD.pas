uses Arrays, System.Diagnostics;

procedure ParallelMult(a, b, c: array[,] of real; n: integer);
begin
  {$omp parallel for}
  for var i := 0 to n-1 do
    for var j := 0 to n-1 do
    begin
      c[i,j] := 0;
      for var l := 0 to n-1 do
        c[i,j] += a[i,l] * b[l,j];
    end;
end;

procedure Mult(a, b, c: array[,] of real; n: integer);
begin
  for var i := 0 to n-1 do
    for var j := 0 to n-1 do
    begin
      c[i,j] := 0;
      for var l := 0 to n-1 do
        c[i,j] += a[i,l] * b[l,j];
    end;
end;

const
  n = 500;

var
  a, b, c: array[,] of real;
  sw: Stopwatch;

begin
  a := Arrays.CreateRandomRealMatrix(n, n);
  b := Arrays.CreateRandomRealMatrix(n, n);
  c := new real[n, n];

  sw := Stopwatch.StartNew;
  ParallelMult(a, b, c, n);
  sw.Stop;
  Writeln('Параллельное умножение: ', sw.ElapsedMilliseconds, ' мс');

  sw.Restart;
  Mult(a, b, c, n);
  sw.Stop;
  Writeln('Последовательное умножение: ', sw.ElapsedMilliseconds, ' мс');
end.

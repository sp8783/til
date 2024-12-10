field = DATA.read.split("\n").map(&:chars)
H = field.size
W = field[0].size

start = [0, 0]
flg = false
H.times do |i|
  W.times do |j|
    if field[i][j] == '^'
      start = [j, i]
      flg = true
    end
    break if flg
  end
  break if flg
end

dxy = [[0, -1], [1, 0], [0, 1], [-1, 0]]
dxy_idx = 0
x, y = start
ans = 1

loop do
  nx = x + dxy[dxy_idx][0]
  ny = y + dxy[dxy_idx][1]
  break if nx < 0 || nx >= W || ny < 0 || ny >= H

  if field[ny][nx] == '#'
    dxy_idx = (dxy_idx + 1) % 4
  else
    if field[ny][nx] == '.'
      field[ny][nx] = 'X'
      ans += 1
    end
    x, y = nx, ny
  end
end
# field.each { |row| puts row.join }
puts ans

__END__
.........................................#.....#..##.....................#...........................#.....................#....#.
..................#................................#..#.................................#................#........................
.....##.........#..#........#......#............#.....#..................#............................#...#...#..#...#............
#..#...#....#...#.................................#.........................................#...............................#.....
.................##...................................................#.........................#....................#............
.............#.............#...................#...................#..................................#....#..#........#....#.....
..#.........................................................................................##....#.................#.............
...........#.........#.....#..#.................#...........##..........#....#....................................#........#.#....
#...#.........................................#..........................................................#........................
.............................................#................................#...............................##..........#.......
......#....#..............#..........................................#....#........................#...................##....#....
........#.#..............................#..#.............#.......#............................................................#..
....#...............#...#..#......#...........................#........................#...........#...#...................#......
..........................#...........##....#.......................................#..........................#.#................
....................#.........................................................#........#..........................................
..............#.............#.##.............#.........#..........#.......................................#...#.........#..#......
...............................................................#..........#........#.........#.............#.............#........
............#.................#...................#....#......................................................................#...
.......#....##....#......##.........#...........................................#....................................#.........#..
......#...#......................#............................##....##....................#.......................................
...................................##....................#.............................#........................#.................
..........................#.#.........................#..........................................................#................
.............#...#..........................................................#..#.#.#.....#....#.....#...................#........#
....#......#.............#...#......#.........#............##..................#.......................#..........................
.......................#.....#...................................#..........................#.....................................
#.....##....................................#.....#.....................................................#....#....................
............#...#...................................................................#.........#......................#............
................#....................................#.....#.........#.........#..............#...................................
..........................................................................................#.....#.#...#.........#.......#.........
#.............#..............................................#...#.#..#.....................#...#............#.#...#..............
..........................................#..................................................................#...#................
.........#.............................................#................................#.................#.....#................#
........................................................................................#.......#.....#..........#..........#.....
...........................#.......#......#..........#............#...............#........#...#......#...........................
...##...................#.................................#..................................##...................................
........................................................#.#.#.....#............................##................#................
......................................#....................#..................#...#.............................#...........#.....
.............................#...#.................#.............................#..............#.................................
#.....................................................................................................................#..#.....#..
...........................#..............................................#................................#....................#.
......#..................##................#....................#.............................................................#..#
.................#....................................................................................#...........................
....#.#..................................#..#........................##...#.............................#..............#..........
...............................................................................................................#...#.....#........
..#...................#.......................#........................................................................#..........
..#............#......................................###.........#..............................#..........#.................#...
.................................#..........................................................................#............#........
......................#...#...............#..............................#.......#........................#...........#........#..
..#..................#............................................................................#......#........................
..........................................................................#....#........#...................#.............#.......
..............#.........#.#............................................................................................#..........
........................#...#............................................#..............................#.........................
.........................................#...................................................#........................#...........
...#.................................................#..........#.............................#.....#.#.........#.................
............................#...........#...............................................................#........................#
..........................#..#..................#....................................#..................#.......................#.
......#...................#..............................#........#.##..........................................................#.
...........................#.....#.............................................................................#..................
..............#........................................................#.#.......#...#................#....#......................
...#...#..........................................................................................................................
..........##.....................#.#.............#...............................#.........................................#......
.#.#...................#.................................#.................................................#....#.................
........................#..............................................................................................#.......#..
...#....................................................................................................#.....##.....#............
.............#........................#.....................................................#.............#....................#.#
#........................................................................................#.....#..................................
........#..............#...............................#.......#...................................#..........#...................
.....................#.........................#.......#.......#.....#...........................................................#
...............#.....................................................................#..........#.................................
.................................#....#..........#..............................#...........#............................#........
..............#......#.........#...#.............#.......................#....#...................................................
...........................................................^.......................................................#..............
..........#...............................#.........................#.....................................................#.....#.
.##.....................#....................#.....#.......................................................#..##...#..........#...
.......................#...........#..#.#.....................................................#....................#..............
..................................................................#......#.............#..................................#.......
.#............................................#........................#...................................#.........#............
..................................................................................#.##.........................#..................
................#........#...........................................#...................................#........................
...............#........#....#...................#................................#........#.....#..........#.................#...
.....#.............................#..........................................................................................#...
............#..............#.....#........................................#............#............##..........#.................
........................................................................................#..........................#........##....
..#............................#...#.................................#....#..............#........................................
...#.....................#...........................................................................#.....................#......
....#.........................#.............#..................................#.........#..............#.........................
.....................#...................................................................................#..#......#..............
.....#.................................#...............................#.....#..........#.........................................
............#........#..........#....................#....................#..#.#.....................................#............
........................................#......#......................#......................................#..#.......#.........
...#...........#...............#.................#.............................................#..........#...#...................
.......#....##..............................#......#.......................#..................#..........#.................#...#..
.................................##...........................................................#....#..........#.#........#........
..................................#....##..#..#.......#............................#............#.#........................#......
..........................................#.....................................#.............##...#............#.................
....#....................#................................#....#..#.....................#................#...#..#..#..............
.............#...#..............................................................................#.................................
..........#..........................#.......................................#....................#..#.......#.........#.....#....
......................#............#...............#.....#.................#...............................#...#....#.........##..
..........................................................................##.............................#...#..............#.....
#.#...#..................................................#..................................#..#...#..............................
...........................................#....#..............#.........................#........................................
...........#....................#.....................##........................#.....#...................................#....#..
..........#..........#.................................................#...............................................#..........
.....................................................................................#......#.....................#.#.............
........#.#..........................#...............................................................................#............
..............#..#.............#...........#......................#....#..#......#...................#............................
........#.......#.................#........#..........#.....................#.........................................#...........
..........................................................#...................................#.....#.........#......#...#........
..........#.....#.....................#............#............#.#......................#....#.##.............#...........#......
...#.#..#.......#......#........#...........................#....................#.....#.........#...........#.................#..
........#.......................................#............#.............#..................#......#......#...............#.#...
....................#.....#........#.........................#.................................................#................#.
.......#..#...........................................#......#..................#..#......................#..#....................
#.#........#....#...#.............................................#............................#.....................#............
#...................#...........#...................#..#................................................................#.#.......
............#...#.#...........#..#.....................................................................#........................#.
...#..............................................#..............#......#...#..............................................#......
................#...#..#..................................................................................................##...#..
.............................#...#..#........#.........#...#...................#............................................#.....
............#......................#.......................................................#.#....................................
...#......................#......#.#...........................................#.....#....#......................#...#............
.....#..#..........#.............................#..........................................#............#..................#.....
.................#...#.......................#..................................................#....................#............
............#..................................................#.....#..............#.......#.............................#.#....#
........#.............#..#.......................................................................................#.........#......
......#...................#..........................................................#................#................#.........#
..................#...........................#.....#....#.......................................#..#......................#......
....................#....................................#....................#........#............#........#....#...............
.........#..............#....#.............................#..#..........#........#.....................#.#.........#.............

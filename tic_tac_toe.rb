class Board
  def initialize (tl = " ", tc = " ", tr = " ", ml = " ", mc = " ", mr = " ", bl = " ", bc = " ", br = " ")
    @tl = tl; @tc = tc; @tr = tr;
    @ml = ml; @mc = mc; @mr = mr;
    @bl = bl; @bc = bc; @br = br;
  end

  def show_board
    puts "#{@tl} | #{@tc} | #{@tr}"
    puts "---------"
    puts "#{@ml} | #{@mc} | #{@mr}"
    puts "---------"
    puts "#{@bl} | #{@bc} | #{@br}"
  end


  def record_move (player, choice)
    if choice == "tl"
      @tl = player
    elsif choice == "tc"
      @tc = player
    elsif choice == "tr"
      @tr = player
    elsif choice == "ml"
      @ml = player
    elsif choice == "mc"
      @mc = player
    elsif choice == "mr"
      @mr = player
    elsif choice == "bl"
      @bl = player
    elsif choice == "bc"
      @bc = player
    elsif choice == "br"
      @br = player
    else puts "Invalid choice"
    end
    show_board
    check_for_winner
end

  def check_for_winner
    if (@tl == @tc && @tl == @tr) && (@tr != " ")    #top row
      puts "Player #{@tl} wins!"
      $game_over = 1
    elsif (@ml == @mc && @ml == @mr) && (@mr != " ") #middle row
      puts "Player #{@ml} wins!"
      $game_over = 1
    elsif (@bl == @bc && @bl == @br) && (@br != " ") #bottom row
      puts "Player #{@bl} wins!"
      $game_over = 1
    elsif (@tl == @ml && @tl == @bl) && (@tl != " ") #left column
      puts "Player #{@tl} wins!"
      $game_over = 1
    elsif (@tc == @mc && @tc == @bc) && (@tc != " ") #center column
      puts "Player #{@tc} wins!"
      $game_over = 1
    elsif (@tr == @mr && @tr == @br) && (@tr != " ") #right column
      puts "Player #{@tr} wins!"
      $game_over = 1
    elsif (@tl == @mc && @tl == @br) && (@tl != " ") #left cross
      puts "Player #{@tl} wins!"
      $game_over = 1
    elsif (@tr == @mc && @tr == @bl) && (@tr != " ") #right cross
      puts "Player #{@tr} wins!"
      $game_over = 1
    end
  end

end

b = Board.new
$game_over = 0
xmove = 0
ymove = 0

while $game_over == 0 do
  b.show_board
  print "Player X, choose a square >"
  xmove = gets.chomp
  b.record_move("X", xmove)
  #b.check_for_winner
  b.show_board
  print "Player O, choose a square >"
  ymove = gets.chomp
  b.record_move("O", ymove)
  #b.check_for_winner
end

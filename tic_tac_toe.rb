class TicTacToe
    attr_accessor :status
    
    def initialize(player)
      @player = player
      @status = true
    end
    
    @@win = ['123', '456', '789', '147', '258', '369', '159', '357']
    @@results = {}
    @@board =  
      '     -------------
       | 1 | 2 | 3 |
       |-----------|
       | 4 | 5 | 6 |
       |-----------|
       | 7 | 8 | 9 |
       -------------'
  
    def start_game()
      puts @player == 1 ? 
       'Player1: Place X' : 'Player2: Place O', @@board
           
      x, o = [], []
      @@results.each {|k, v| v == 'X' ? x.push(k) : o.push(k)}
      xo = x.repeated_permutation(3).to_a + 
           o.repeated_permutation(3).to_a
     
      xo.each {|x| (@@win.include? x.join) ? end_game() : ''}
    end
    
    def choose_block(block_num)
      game_mark = (@player == 1) ? 'X' : 'O'
       
      if @@board.include? block_num
        @@results.store(block_num, game_mark)
        @@board = @@board.sub(block_num, game_mark)
      else 
        puts "block #{block_num} was already taken"
        input_error(game_mark)
      end
    end
  
    def input_error(mark)
      puts @@board
      puts "Player#{@player}: Place #{mark}"
      puts choose_block(gets.chomp!)
    end
  
    def end_game()
      @status = false
      a = @@board.count('X')
      b = @@board.count('O')
      
      puts a > b ? 
      "Game Over: PLAYER 1 WINS!" :
      "Game Over: PLAYER 2 WINS!"
    end 
  end
   
  player1 = TicTacToe.new(1)
  player2 = TicTacToe.new(2)
  game = TicTacToe.new('')
  
  x = 0
  while game.status
    x += 1
    if x.odd?
      player1.start_game()
      player1.choose_block(gets.chomp!)
    elsif x.even?
      player2.start_game()
      player2.choose_block(gets.chomp!)
    end
  end
  
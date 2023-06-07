class TicTac
    class Player
        # Adds setter method. allows the name to be changed
        attr_accessor :name 
        def initialize
            @name = ""
            
        end
    end




    def initialize
        @the_board = [[1, 2, 3],
                      [4, 5, 6],
                      [7, 8, 9]]
        @player1 = Player.new
        @player2 = Player.new
        @winner = false
        @draw = false
        @turn = 0
        
    end

    def printBoard
        @the_board.each do |square|
            square.each do |innerArr|
                if innerArr == 0
                    print "[ ]"
                    
                elsif innerArr == "x"
                    print "[X]"
                elsif innerArr == "o"
                    print "[O]"

                else  
                    print "[#{innerArr}]"
                end
            end
        puts
        end
    end

    def player1wincon?
        # Player 1 win conditions
        
        if @the_board[0][0..2].all? {|num| num == "x"}
            return true
        
        elsif @the_board[1][0..2].all? {|num| num == "x"}
            return true
        
        elsif @the_board[2][0..2].all? {|num| num == "x"}
            return true
        
        elsif @the_board[0][0] == 1 && @the_board[1][1] == "x" && @the_board[2][2] == "x"
            return true

        elsif @the_board[0][2] == 1 && @the_board[1][1] == "x" && @the_board[2][0] == "x"
            return true

        else   
            return false
        
        # of  statements
        end

    #  of player1wincon?
    end

    def player2wincon?
        # Player 1 win conditions
        
        if @the_board[0][0..2].all? {|num| num == "o"}
            return true
        
        elsif @the_board[1][0..2].all? {|num| num == "o"}
            return true
        
        elsif @the_board[2][0..2].all? {|num| num == "o"}
            return true
        
        elsif @the_board[0][0] == "o" && @the_board[1][1] == "o" && @the_board[2][2] == "o"
            return true

        elsif @the_board[0][2] == "o" && @the_board[1][1] == "o" && @the_board[2][0] == "o"
            return true

        else 
            return false
        
        # statements
        end
    # end of player2wincon?
    end
    
    # Tests win conditions of both players
    def wincon?
        if player1wincon?
            return true 
        end

        if player2wincon?
            return true
        end
    end

    def player1_turn
        puts "#{@player1.name}'s turn. Enter the number of the tile you'd like to claim"
        userChoice = gets.chomp.to_i
        if userChoice == 1 || userChoice == 2 || userChoice == 3
        
            @the_board[0][userChoice - 1] = "x"
            @turn += 1
        
        elsif userChoice == 4 || userChoice == 5 || userChoice == 6
            @the_board[1][userChoice - 4] = "x"
            @turn += 1

        elsif userChoice == 7 || userChoice == 8 || userChoice == 9
            @the_board[2][userChoice - 7] = "x"
            @turn += 1

        end
        
    end

    def player2_turn
        puts("Your symbol is the O")
        puts "#{@player2.name}'s turn. Enter the number of the tile you'd like to claim"
        userChoice = gets.chomp.to_i
        if userChoice == 1 || userChoice == 2 || userChoice == 3
            @the_board[0][userChoice - 1] = "o"
            @turn += 1
        
        elsif userChoice == 4 || userChoice == 5 || userChoice == 6
            @the_board[1][userChoice - 4] = "o"
            @turn += 1

        elsif userChoice == 7 || userChoice == 8 || userChoice == 9
            @the_board[2][userChoice - 7] = "o"
            @turn += 1

        end
    end

    def get_winner?
        return @winner
    end

    def get_draw?
        if @turn == 9
            return true
        else
            return false
        end
    end

    def input_name
        print("Please enter the name of player 1: ")
        @player1.name = gets.chomp

        print("Please enter the name of player 2: ")
        @player2.name = gets.chomp

    end

    def game_loop
        
        # User input the player's names
        input_name
        printBoard

        # Loop  winner condition
        while get_draw? == false
            
            # Player 1 turn
            player1_turn
            
            # Check player 1 wincon
            if wincon?
                player_win
            end
            
            if get_draw?
                break
            end
        
        
            # Game goes on
            printBoard

            # player 2's turn
            player2_turn

            # Check player 2's wincon
            if wincon?
                player_win
            end

            printBoard
            
            # Loop continues  someone wins or draw
            
        end

        
        puts("It's a draw.")
        continue_game? ? game_loop : exit
    end
        
        
        

        
    # End of game_loop
    

    def player_win
        if player1wincon?
            puts("#{@player1.name} has won.")
            printBoard
        elsif player2wincon?
            printBoard
            puts("#{@player2.name} has won.")

        end

        continue_game? ? game_loop : exit

        
    end


    def continue_game?
        print("Would you like to play another game? (y or n) ")
        decision = gets.chomp

        if decision == "y"
            return true
        else 
            return false
        end
    end

end


# End of Class
#-------------------------------------------------------------------------------------------------------------


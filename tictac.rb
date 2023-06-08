require 'colorize'

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
        @moves = []
        
    end

    def printBoard
        puts("The Board:".colorize(:mode => :italic))
        @the_board.each do |square|
            square.each do |innerArr|
                if innerArr == 0
                    print "[ ]"
                    
                elsif innerArr == "X"
                    print "[X]"
                elsif innerArr == "O"
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

        player1sym = "X".colorize(:color => :red, :mode => :bold)
        
        if @the_board[0][0..2].all? {|num| num == player1sym}
            return true
        
        elsif @the_board[1][0..2].all? {|num| num == player1sym}
            return true
        
        elsif @the_board[2][0..2].all? {|num| num == player1sym}
            return true

        elsif @the_board[0][0] == player1sym && @the_board[1][0] == player1sym && @the_board[2][0] == player1sym
            return true
        
        elsif @the_board[0][1] == player1sym && @the_board[1][1] == player1sym && @the_board[2][1] == player1sym
            return true
        
        elsif @the_board[0][2] == player1sym && @the_board[1][2] == player1sym && @the_board[2][2] == player1sym
            return true
        
        elsif @the_board[0][0] == player1sym && @the_board[1][1] == player1sym && @the_board[2][2] == player1sym
            return true

        elsif @the_board[0][2] == player1sym && @the_board[1][1] == player1sym && @the_board[2][0] == player1sym
            return true

        else   
            return false
        
        # of  statements
        end

    #  End of player1wincon?
    end

    def player2wincon?
        # Player 2 win conditions

        player2sym = "O".colorize(:color => :blue, :mode => :bold)
        
        if @the_board[0][0..2].all? {|num| num == player2sym}
            return true
        
        elsif @the_board[1][0..2].all? {|num| num == player2sym}
            return true
        
        elsif @the_board[2][0..2].all? {|num| num == player2sym}
            return true

        elsif @the_board[0][0] == player2sym && @the_board[1][0] == player2sym && @the_board[2][0] == player2sym
            return true
        
        elsif @the_board[0][1] == player2sym && @the_board[1][1] == player2sym && @the_board[2][1] == player2sym
            return true
        
        elsif @the_board[0][2] == player2sym && @the_board[1][2] == player2sym && @the_board[2][2] == player2sym
            return true
        
        elsif @the_board[0][0] == player2sym && @the_board[1][1] == player2sym && @the_board[2][2] == player2sym
            return true

        elsif @the_board[0][2] == player2sym && @the_board[1][1] == player2sym && @the_board[2][0] == player2sym
            return true

        else   
            return false
        
        # of  statements
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
        print("#{@player1.name}'s symbol is ")
        print("X".colorize(:color => :red, :mode => :bold)); puts()
        puts ("Enter the number of the tile you'd like to claim")
        
        userChoice = gets.chomp.to_i
        
        if (userChoice >= 1 && userChoice <= 9) && !@moves.include?(userChoice)
            if userChoice == 1 || userChoice == 2 || userChoice == 3
                @the_board[0][userChoice - 1] = "X".colorize(:color => :red, :mode => :bold)
            
            elsif userChoice == 4 || userChoice == 5 || userChoice == 6
                @the_board[1][userChoice - 4] = "X".colorize(:color => :red, :mode => :bold)
                
            elsif userChoice == 7 || userChoice == 8 || userChoice == 9
                @the_board[2][userChoice - 7] = "X".colorize(:color => :red, :mode => :bold)
            end
            
            @turn += 1
            @moves << userChoice
        
        else 
            if userChoice < 1 || userChoice > 9
                puts("You have entered an invalid value.")
                puts("Please try again. Enter an integer from 1 through 9")
                printBoard
                return player1_turn

            elsif @moves.include?(userChoice)
                puts("That spot is already taken")
                puts("Enter an available spot")
                printBoard
                return player1_turn
            end
        end        
    end

    def player2_turn
        print("#{@player2.name}'s symbol is ")
        print("O".colorize(:color => :blue, :mode => :bold)); puts()
        puts("Enter the number of the tile you'd like to claim")
        
        userChoice = gets.chomp.to_i
        
        if (userChoice >= 1 && userChoice <= 9) && !@moves.include?(userChoice)
            if userChoice == 1 || userChoice == 2 || userChoice == 3
                @the_board[0][userChoice - 1] = "O".colorize(:color => :blue, :mode => :bold)
            
            elsif userChoice == 4 || userChoice == 5 || userChoice == 6
                @the_board[1][userChoice - 4] = "O".colorize(:color => :blue, :mode => :bold)
                
            elsif userChoice == 7 || userChoice == 8 || userChoice == 9
                @the_board[2][userChoice - 7] = "O".colorize(:color => :blue, :mode => :bold)
            end
            
            @turn += 1
            @moves << userChoice
        
        else 
            if userChoice < 1 || userChoice > 9
                puts("You have entered an invalid value.")
                puts("Please try again. Enter an integer from 1 through 9")
                printBoard
                return player2_turn

            elsif @moves.include?(userChoice)
                puts("That spot is already taken")
                puts("Enter an available spot")
                printBoard
                return player2_turn
            end
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
        @player1.name = gets.chomp.capitalize 

        print("Please enter the name of player 2: ")
        @player2.name = gets.chomp.capitalize

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

        @the_board = [[1, 2, 3],
                      [4, 5, 6],
                      [7, 8, 9]]

        continue_game? ? game_loop : exit

        
    end


    def continue_game?
        print("Would you like to play another game? (y or n) ")
        decision = gets.chomp.to_s.downcase
        if decision != "y" && decision != "n"
            puts("Please enter either 'y' for yes or 'n' for no")
            continue_game?
        
        elsif decision == "y"
            return true
        else 
            return false
        end
    end

end


# End of Class
#-------------------------------------------------------------------------------------------------------------


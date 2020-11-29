class Piece
    attr_reader :color, :type, :symbol

    def initialize(color, type)
        @color = color
        @type = type
        @symbol = set_symbol(color, type)
    end

    def set_symbol(color, type)
        if color == "white"
            return "K" if type == "king"
            return "Q" if type == "queen"
            return "R" if type == "rook"
            return "B" if type == "bishop"
            return "H" if type == "knight"
            return "P" if type == "pawn"
        else
            return "$" if type == "king"
            return "@" if type == "queen"
            return "#" if type == "rook"
            return "?" if type == "bishop"
            return "&" if type == "knight"
            return "*" if type == "pawn"
        end
    end
end

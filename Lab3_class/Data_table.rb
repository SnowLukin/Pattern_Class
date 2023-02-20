# Represents a two-dimensional table of data.
class DataTable
    # Creates a new DataTable object.
    #
    # @param data [Array<Array>] a two-dimensional array of data to be stored in the table
    def initialize(data)
        @data = data
    end
    
    # Gets the value of the cell at the specified row and column indices.
    #
    # @param row [Integer] the zero-based index of the row containing the cell
    # @param col [Integer] the zero-based index of the column containing the cell
    # @return [Object] the value of the cell
    def [](row, col)
        @data[row][col]
    end
    
    # Gets the number of rows in the table.
    #
    # @return [Integer] the number of rows
    def row_count
        @data.size
    end
    
    # Gets the number of columns in the table.
    #
    # @return [Integer] the number of columns
    def column_count
        @data[0].size
    end
end

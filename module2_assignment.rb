#Implement all parts of this assignment within (this) module2_assignment2.rb file

#Implement a class called LineAnalyzer.
class LineAnalyzer
  attr_accessor :highest_wf_count, :highest_wf_words, :content, :line_number
  #Implement the following read-only attributes in the LineAnalyzer class. 
  #* highest_wf_count - a number with maximum number of occurrences for a single word (calculated)
  #* highest_wf_words - an array of words with the maximum number of occurrences (calculated)
  #* content          - the string analyzed (provided)
  #* line_number      - the line number analyzed (provided)
  

  def initialize(content, line_number)
    @content = content
    @line_number = line_number
    @highest_wf_count = highest_wf_count
    @highest_wf_words = []
    calculate_word_frequency()
  end
  def calculate_word_frequency()
    #lineArr = content.split /(?=[A-Z])/
    newArr = @content.downcase.split(" ")
    finArr = Array.new(newArr.length) { Array.new }
    
    for i in 0..newArr.length
        count = newArr.count(newArr[i])
        addArr = [count.to_i, "#{newArr[i]}"]
        finArr << addArr
    end
    co = 0
    #finArr.sort!.delete_at(0)
    finArr.reject! { |item| item.nil? || item == [0,""] }
    finArr.reject! { |item| item.nil? || item == [] }
    finArr.reject! { |item| item.nil? || item == nil}
    for i in 0..finArr.length-1

      if finArr.slice(i).values_at(0).join.to_f.to_i ==  finArr.max.values_at(0).join.to_f.to_i
        @highest_wf_words <<  finArr.slice(i).values_at(1).join.to_s
        @highest_wf_count =  finArr.max.values_at(0).join.to_f.to_i
        @highest_wf_words.sort!.uniq!
        #p 
      end
    end


    
    #for i in 0..finArr.length
     # if finArr[i][0][0].eq?finArr[i+1]
    #end
  end
end





    
  
  #Add the following methods in the LineAnalyzer class.
  #* initialize() - taking a line of text (content) and a line number
  #* calculate_word_frequency() - calculates result

  #Implement the initialize() method to:
  #* take in a line of text and line number
  #* initialize the content and line_number attributes
  #* call the calculate_word_frequency() method.

  #Implement the calculate_word_frequency() method to:
  #* calculate the maximum number of times a single word appears within
  #  provided content and store that in the highest_wf_count attribute.
  #* identify the words that were used the maximum number of times and
  #  store that in the highest_wf_words attribute.


#  Implement a class called Solution. 
class Solution

  # Implement the following read-only attributes in the Solution class.
  #* analyzers - an array of LineAnalyzer objects for each line in the file
  #* highest_count_across_lines - a number with the maximum value for highest_wf_words attribute in the analyzers array.
  #* highest_count_words_across_lines - a filtered array of LineAnalyzer objects with the highest_wf_words attribute 
  #  equal to the highest_count_across_lines determined previously.
  attr_accessor :analyzers, :highest_count_across_lines, :highest_count_words_across_lines
  
  def initialize
    @analyzers = []
  end
  def analyze_file()
      lineCount = 0
      fil = File.open( 'test.txt' )
      
      fil.each_line do |line|
        lineCount +=1
        #p LineAnalyzer.new(line, lineCount)
        @analyzers << LineAnalyzer.new(line, lineCount)
        p @analyzers.length
      end
  end

  def calculate_line_with_highest_frequency()
    
    countArr =[]
    @highest_count_words_across_lines = []
    @analyzers.each do |index|
      #p index.highest_wf_words
      countArr << index.highest_wf_count
      @highest_count_across_lines = countArr.max
      #p countArr.max
      if index.highest_wf_count == highest_count_across_lines
        #p index.highest_wf_words
        @highest_count_words_across_lines << index
        @highest_count_words_across_lines.flatten
        #p @highest_count_words_across_lines.flatten
      end
      end
  end

  def print_highest_word_frequency_across_lines()
    p "The following words have the highest word frequency per line: "
    @analyzers.each do |index|
      p "#{index.highest_wf_words} (appears in line #{index.line_number})"
    end
  end
end

solution = Solution.new
#expect errors until you implement these methods
solution.analyze_file
solution.calculate_line_with_highest_frequency
solution.print_highest_word_frequency_across_lines

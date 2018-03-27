#Implement all parts of this assignment within (this) module2_assignment2.rb file

#Implement a class called LineAnalyzer.
class LineAnalyzer
  attr_accessor :highest_wf_count, :highest_wf_words, :content, :line_number
  #Implement the following read-only attributes in the LineAnalyzer class. 
  #* highest_wf_count - a number with maximum number of occurrences for a single word (calculated)
  #* highest_wf_words - an array of words with the maximum number of occurrences (calculated)
  #* content          - the string analyzed (provided)
  #* line_number      - the line number analyzed (provided)
  

  #@@highest_wf_words = []
  def initialize(content, line_number)
    @content = content
    @line_number = line_number
    @highest_wf_count = highest_wf_count
    @highest_wf_words = []
    calculate_word_frequency()
  end
  def calculate_word_frequency()
    #lineArr = content.split /(?=[A-Z])/
    newArr = content.downcase.split(" ")
    finArr = Array.new
    
    for i in 0..newArr.length
        count = newArr.count(newArr[i])
        addArr = [count, "#{newArr[i]}"]
        finArr << addArr
    end
    co = 0
    #finArr.sort!.delete_at(0)
    finArr.reject! { |item| item.nil? || item == '' }
    p finArr
    for i in 0..finArr.length
      p finArr[i]
      #p @highest_wf_words.last(co.uniq)
      if finArr[i] == finArr[i]
        co +=1
        finArr.reject! { |item| item.nil? || item == nil }
        @highest_wf_words << finArr[i]
        @highest_wf_count = finArr[i]
        p highest_wf_count
        @highest_wf_words.uniq!
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
  

  def analyze_file()
      lineCount = 0
      fil = File.foreach( 'C:\Users\Zack\Documents\graded-assignments\graded-assignments\course01\module02\assignment-Calc-Max-Word-Freq\test.txt' )
      fil.each do |line|
        lineCount +=1
        @analyzers ||= []
        @analyzers << LineAnalyzer.new(line, lineCount)
        p analyzers
      end
  end

  def calculate_line_with_highest_frequency()
    analyzers.length do |index|

      highest_count_across_lines = analyzers[index].calculate_word_frequency().max
      highest_count_words_across_lines = analyzers[index].highest_wf_count==(highest_count_across_lines)
    end
  end

  def print_highest_word_frequency_across_lines()
    puts highest_count_words_across_lines
  end
end

solution = Solution.new
#expect errors until you implement these methods
solution.analyze_file
solution.calculate_line_with_highest_frequency
solution.print_highest_word_frequency_across_lines

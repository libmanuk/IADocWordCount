# IADocWordCount
Bash script which takes arguments and uses them to gather item word count from an Internet Archive object.

This script takes 2 arguments from the commandline.

1: Identifier for the Internet Archive Object
2: Free text designating a 'grouping' for the gathered files.

Sample script execution: "bash ia_word_count.sh myid doc"

Data gathered from the Internet Archive:

1: djvu.txt file which hold the raw OCR text for the object.
2: API call which gathered a JSON file holding the publication date for the object.
3: Parse date from JSON file and store as a variable.

Processing:

1: Count the number of words in the djvu.txt file.
2: Store the word count in a file that is named 'grouping_date_identifier_words.txt' 

CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

# step 1 - clone relevant to specific directory
mkdir grading-area
git clone $1 student-submission

echo 'Finished cloning'

# step 2 - check for relevant files
if [[ -e student-submission/*/ListExamples.java ]]
then
    echo 'ListExamples.java exists'
    if [[ -f student-submission/*/ListExamples.java ]]
    then
        echo 'ListExamples.java is a file'
    else
        echo 'ListExamples.java is not a file'
        exit
else
    echo 'ListExamples.java does not exist'
    exit
fi

# step 3
cp student-submission/*/*.java grading-area

# step 4
javac grading-area *.java > javac_output.txt
if ! [[ $? -eq 0 ]]
then
    echo 'Yippee'
else
    echo javac_output.txt
    exit
fi

# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests

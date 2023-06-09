CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

# step 1 - clone relevant to specific directory
mkdir grading-area
git clone $1 student-submission

echo 'Finished cloning'

# step 2 - check for relevant files
## check for occurences
find student-submission > find_results.txt
GREP=`grep -c "ListExamples.java" find_results.txt`

if ! [[ $GREP == 0 ]]
then
    echo 'ListExamples.java found'
else
    echo 'ListExamples.java not found'
fi

# step 3
find student-submission -name \*.java -exec cp {} grading-area \;
cp TestListExamples.java grading-area
cp -r lib grading-area

# step 4
cd grading-area
javac -cp $CPATH *.java > javac_output.txt
if [[ $? -eq 0 ]]
then
    echo 'code successfully compiles'
else
    cat javac_output.txt
    exit
fi

# step 5
pwd
ls
java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > test_output.txt
if [[ $? -eq 0 ]]
then
    echo 'good job :)'
else
    cat test_output.txt
    exit
fi
cd ..

# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests

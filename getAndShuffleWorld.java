import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Random;
import java.util.Scanner;

public class getAndShuffleWorld {
    
    public String shuffleWordsNow(int range) throws FileNotFoundException {
        File listOfWords = new File("src/wordList.txt");
        Scanner scan = new Scanner(listOfWords);
        ArrayList<String> data = new ArrayList<String>();

        while(scan.hasNextLine()){
            data.add(scan.nextLine());
        }
        scan.close();

        String[] wordsArr = data.toArray(new String[]{});

        Random random = new Random();
        String randomWordString = "";
        for(int i = 0; i < range; i++) {
            randomWordString += wordsArr[random.nextInt(1000)] + " ";
        }

        randomWordString.trim();
        return randomWordString;
    }
}

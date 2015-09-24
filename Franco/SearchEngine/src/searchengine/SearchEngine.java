/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor. 
 */
package searchengine;

import java.util.ArrayList;
import java.util.StringTokenizer;
import org.apache.commons.lang3.StringUtils;

/**
 *
 * @author Franco
 */
public class SearchEngine {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        ArrayList<String> library = new ArrayList<String>();
        ArrayList<String> tokenList = new ArrayList<String>();
        library.add("The red car is faster than the blue car");
        library.add("The blue car is slower than the green car");
        library.add("The green car is slower than the purple truck");
        library.add("The purple truck is faster than the red car");
        
        System.out.println("Compiling");
       int excerptID = 1;
       int tokenID = 1;
        for(String s : library){
            System.out.println("INSERT INTO `excerpt`(`id`,`text`)VALUES("+ excerptID++ + ",'"+s+"'); ");
            StringTokenizer st = new StringTokenizer(s, " ");
            while(st.hasMoreElements())
            {
                String token = st.nextToken().toLowerCase();
                System.out.println("INSERT IGNORE INTO `token`(`id`,`text`)VALUES("+ tokenID++ + ",'" + s + "');");
                System.out.println("INSERT IGNORE INTO `excerpt_token`(`excerpt_id`,`token_id`)VALUES("+ x++ + ",'" + s + "');");
            }
        }
        
        
        System.out.println("Printing");
        int x = 1;
        for(String s : library){
            System.out.println("INSERT INTO `excerpt`(`id`,`text`)VALUES("+ x++ + ",'"+s+"'); ");
        }
        x = 1;
        for(String s : tokenList){
            
        }
        x = 1;
    }
}


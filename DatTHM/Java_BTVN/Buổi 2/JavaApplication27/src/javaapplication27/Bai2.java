/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package javaapplication27;

/**
 *
 * @author admin
 */
public class Bai2 {
    public static void main(String[] args) {
        String str = "1aba1bh11 ";
        int mid = str.length() / 2;

        int next = mid;

        if (str.length() % 2 != 0) {
            next += 1;
        }
        char arr[] = str.toCharArray();
        for (int i = 0; i < mid; i++) {
            
            for (int j = next; j < str.length() - 1;) {
                char x = str.charAt(arr[i]);
                char y = str.charAt(arr[arr.length-1-i]);
                int a = Character.compare(x, y);
                if (a == 0) {
                    System.out.println("i= " + str.charAt(arr[i]));
                }
                j++;
                break;
            }
        }
    }
}

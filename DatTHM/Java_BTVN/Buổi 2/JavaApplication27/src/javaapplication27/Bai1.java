/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package javaapplication27;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class Bai1 {

    public static void main(String[] args) {
        List<Integer> interArrMax = new ArrayList<Integer>();

        int arrInt[] = {3, 5, 4, 1, 99, 200, 98, 97, 2, 3};
        int lengthArr = arrInt.length;

        for (int i = 0; i < lengthArr - 1;) {
            int tongMax = arrInt[i];
            int count = 0;

            while (i + 1 < arrInt.length && arrInt[i] < arrInt[i + 1]) {
                tongMax += arrInt[i + 1];
                i++;
                count += 1;
            }
            if (count != 0) {
                interArrMax.add(tongMax);
            } else {
                i++;
            }
        }

        System.out.println("array max " + interArrMax);
    }
}

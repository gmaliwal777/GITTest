//
//  ViewController.swift
//  TestSwift
//
//  Created by Macmini on 11/7/18.
//  Copyright © 2018 Macmini. All rights reserved.
//

import UIKit

// New comment

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let nums = [-1,0,1,2,-1,-4]
        
        // -4,-3,-2,-1,0,1,2,3,4,5
        //
        
        let result = threeSum(nums)
        print(result)
    }

    func threeSum(_ nums: [Int]) -> [[Int]] {
        
        guard nums.count > 2 else {return [[Int]]()}
        
        let nums = nums.sorted()
        
        var resultSet : Set<[Int]> = Set<[Int]>()
        
        for i in 0...nums.count-3 {
            let firstElement = nums[i]
            
            if firstElement > 0 {
                // We will break if first element itself is more than 0
                break
            }
            
            var j = i + 1
            var k = nums.count - 1
            
            while (j < k) {
                let secondElement = nums[j]
                let thirdElement = nums[k]
                
                if firstElement + secondElement > 0 {
                    // We will break if first element and second element are more than 0
                    break
                }
                
                let sum = firstElement + secondElement + thirdElement
                if firstElement + secondElement + thirdElement == 0 {
                    resultSet.insert([firstElement,secondElement,thirdElement])
                    j = j + 1
                    k = k - 1
                } else if sum > 0 {
                    k = k - 1
                } else if sum < 0 {
                    j = j + 1
                }
            }
            
        }
        return Array(resultSet)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


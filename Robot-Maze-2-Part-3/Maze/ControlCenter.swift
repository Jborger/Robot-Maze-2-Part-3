//
//  ControlCenter.swift
//  Maze
//
//  Created by Jarrod Parkes on 8/14/15.
//  Copyright © 2015 Udacity, Inc. All rights reserved.
//
import UIKit

class ControlCenter {

    var mazeController: MazeController!

    func moveComplexRobot(myRobot: ComplexRobotObject) {
        
        let robotIsBlocked = isFacingWall(myRobot, direction: myRobot.direction)
        
        /*if robotIsBlocked == true {
         randomlyRotateRightOrLeft(myRobot)
         }
         else {
         continueStraightOrRotate(myRobot)
         
         }
         */
    
        // Step 2.1c
        // TODO: Save the return value of checkWalls() to a constant called myWallInfo.
        let myWallInfo = checkWalls(myRobot)
        
        // Step 2.2a
        // Categorize the robot's current location based on the number of walls
        
        let isThreeWayJunction = (myWallInfo.numberOfWalls == 1)
        
        let isTwoWayPath = (myWallInfo.numberOfWalls == 2)
        
        let isDeadEnd = (myWallInfo.numberOfWalls == 3)
        
        
        // Step 2.2b
        // Test whether the values of the above constants are correct
        
        // Step 2.3a
        // Three-way Path - else-if statements
        
        if isThreeWayJunction && robotIsBlocked {
            randomlyRotateRightOrLeft(myRobot)
        }
        
        // TODO: If the robot encounters a three way junction and there is NO wall ahead, it should continue straight or rotate (you need to write this else-if statement)
        else if isThreeWayJunction && !robotIsBlocked{
            continueStraightOrRotate(myRobot, wallInfo: myWallInfo)
        }
        
        // Step 2.3b
        // Two-way Path - else-if statements
        
        // TODO: If the robot encounters a two way path and there is NO wall ahead it should continue forward.
        else if isTwoWayPath && !robotIsBlocked {
           //continueStraightOrRotate(myRobot, wallInfo: myWallInfo)
            myRobot.move()
            
        }
        
        // TODO: If the robot encounters a two way path and there IS a wall ahead, it should randomly rotate.
        else if isTwoWayPath && robotIsBlocked {
            turnTowardClearPath(myRobot, wallInfo: myWallInfo)
            
        }
        
        
        // Step 2.3c
        // Dead end - else-if statements
        if isDeadEnd {
            if robotIsBlocked {
                myRobot.rotateRight()
            }
            myRobot.move()
        }
    }
    

    func previousMoveIsFinished(robot: ComplexRobotObject) {
            self.moveComplexRobot(robot)
}
}

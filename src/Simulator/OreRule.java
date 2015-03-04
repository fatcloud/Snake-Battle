/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Simulator;

/**
 *
 * @author fatcloud
 */
public interface OreRule {
    
    void setSimulator( OreSimulator ores );
    void exec();
    
}

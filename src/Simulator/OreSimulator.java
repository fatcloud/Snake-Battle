/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Simulator;

import java.util.ArrayList;

/**
 *
 * @author fatcloud
 */
/** Object-Rule-Event simulator core
 * 
 * continuous transitions, transitions that can be predicted from the state of
 * an object itself, are simulated via OreObject.updateToMillisecond( t )
 * 
 * discrete transitions, transitions that happen as results of interaction
 * between multiple objects and cause the failure of continuous simultions,
 * are predicted and returned as OreEvent by OreRules.predictToMillisecond( t )
 * 
 * Input actions are also treated as OreEvents
 */
public class OreSimulator {
    // primitive data structure
    ArrayList< OreRule >    rules;
    ArrayList< OreObject >  objects;
    
    // auxiliary data structure, computed results
    ArrayList< OreEvent >   events;
    
    // get objects for rendering
    ArrayList< Object > getObjects(){
        return null;
        
    }
    
    /** perform update based on rules and events */
    public void update(){
    
    }
    
    /** insert input event induced by control */
    public void interrupt(  ){
    }
    
}

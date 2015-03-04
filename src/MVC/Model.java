/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MVC;

/**
 *
 * @author fatcloud
 */
public interface Model< Objs, Sig > {
    
    // pass the objects to renderor
    public Objs getObjects();
    
    // update the internal data structure
    public void update();
    
    // pass a interrupt signal to the model
    public void interrupt( Sig sig );
}

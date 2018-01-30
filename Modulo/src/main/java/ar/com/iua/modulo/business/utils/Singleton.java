package ar.com.iua.modulo.business.utils;

/**
 * Created by mnicolas on 29/01/18.
 */
public class Singleton {

    private static Singleton instance = null;

    protected Singleton() {
        // Exists only to defeat instantiation.
    }

    public static Singleton getInstance() {
        if(instance == null) {
            instance = new Singleton();
        }
        return instance;
    }
}

namespace Lib;
from arrays import array;
_#!Exec c# = {};
_#!Exec lua = {
    #!/bin/lua
    local enviroment = "lua"
    if _CC then
        enviroment = "CC"
        if _CraftOS then
            enviroment = "CraftOSPC"
        end
    end
    if enviroment == "lua" then
        error("Not implemented")
    elseif enviroment == "CC" then
        error("Not implemented")
    elseif enviroment == "CraftOSPC" then
        return term,3
    else
        error("Enviroment not found")
    end
};
private class API,APItype _GETExec()
public class Graphics{
    public function Color24(){
        metadata("new"){
            args = {...};
            return args[1]*65536+args[2]*256+args[3];
        };
    };
    public function Color32(){
        metadata("new"){
            args = {...};
            return args[1]*16777216+args[2]*65536+args[3]*256+args[4];
        };
    };
    public class 2D{
        private table pixels = {};
        public function setPixelArray(input){
            pixels=input;
        };
        public function getPixel(x,y){
        };
        public function setPixel(x,y,c){
        };
        public function line(x1,y1,x2,y2,c){
            private float dy=math.abs(y2-y1)*-1;
            private bool sx=x1<x2&&1|-1;
            private bool sy=y1<y2&&1|-1;
            private float err=dx+dy;
            private ushort counter=0;
            while(true){
                Graphics.2D.setPixel(ox,oy,c);
                counter++;
                if(x1==x2&&y1==y2){
                    return true,counter;
                }
                local tmpErr=2*err;
                if(tmpErr>dy){
                    err=err+dy;
                    x1=x1+sx;
                }
                if(tmpErr<dx){
                    err=err+dx;
                    y1=y1+sy;
                }
            }   
        }
    }
}
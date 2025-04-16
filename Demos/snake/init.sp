namespace SpearSnakeDemo;
public function main(){
    from Graphics import 2D,Color24;
    from OpenWin import GraphicsDisplay,Displays;
    from arrays import array2;
    from builtin import table;
    private ushort resX,resY = Displays.getDisplayResolution(1);
    private table colors = {
        snake=new color24(255,255,0),
        BG=new color24(64,255,0),
        apple=new color24(255,0,0),
        score=new color24(0,0,0)
    };
    private table pixels = new array2(100,50);
    link(Graphics.setPixelArray,pixels);
    window=new GraphicsDisplay(0,0,100,50,1,true)
    link(window.buffer,pixels)
}
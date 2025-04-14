namespace SpearSnakeDemo;
private func snake(){
    from Graphics import 2D,Color24;
    from OpenWin import Graphics;
    from arrays import array2;
    from builtin import table;
    prv class C24=Color24.create;
    prv class 2D=2D.drawing;
    prv class window=Graphics.spawn();
    window.resize(100,50);
    window.allowResize(true);
    window.keepResolutionOnRescale(true);
    window.show();
    prv tbl pixels=array2.new(100,50);
    window.pixArray:pixels;
    2D.array:pixels;
    2D.drawPixels(table.unpack());
}
public func main(){
    snake()
}
public func init(){
    snake()
}
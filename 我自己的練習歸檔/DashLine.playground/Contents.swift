import UIKit
import PlaygroundSupport

let liveView = UIView()
liveView.frame.size = CGSize(width: 300, height: 300)
liveView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
PlaygroundPage.current.liveView = liveView

// ---

var context: CGContext
var lengths: [CGFloat]

let imageView1 = UIImageView(frame: CGRect(x: 10, y: 10, width: 280, height: 20))
liveView.addSubview(imageView1)
 // 位图上下文绘制区域
UIGraphicsBeginImageContext(imageView1.frame.size)
imageView1.image?.draw(in: imageView1.bounds)
context = UIGraphicsGetCurrentContext()!
context.setLineCap(.square)
lengths = [10, 20] // 绘制 跳过 无限循环
context.setStrokeColor(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))
context.setLineWidth(5)
context.setLineDash(phase: 0, lengths: lengths)
context.move(to: CGPoint(x: 0, y: 10))
context.addLine(to: CGPoint(x: 280, y: 10))
context.strokePath()
imageView1.image = UIGraphicsGetImageFromCurrentImageContext()
UIGraphicsEndImageContext()

let imageView2 = UIImageView(frame: CGRect(x: 10, y: 30, width: 280, height: 20))
liveView.addSubview(imageView2)
// 位图上下文绘制区域
UIGraphicsBeginImageContext(imageView2.frame.size)
imageView2.image?.draw(in: imageView2.bounds)
context = UIGraphicsGetCurrentContext()!
context.setLineCap(.square)
lengths = [10, 20] // 绘制 跳过 无限循环
context.setStrokeColor(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))
context.setLineWidth(5)
context.setLineDash(phase: 5, lengths: lengths) // phase表示开始绘制之前跳过多少点进行绘制，默认一般设置为0，第二张图片是设置5的实际效果图
context.move(to: CGPoint(x: 0, y: 10))
context.addLine(to: CGPoint(x: 280, y: 10))
context.strokePath()
imageView2.image = UIGraphicsGetImageFromCurrentImageContext()
UIGraphicsEndImageContext()

// 未完，待續。
// https://www.jianshu.com/p/f9009968c735

//
//  Split.swift
//  Split
//  Copyright © 2016年 jerry. All rights reserved.
//

import Foundation
extension NSString{
    public func Split(s:String)->[String]{
        var content = self as String
        var arr = [String]()  //创建一个空字符串数组        
        let len1 = s.characters.count//计算s的长度
        var tmpStr = ""//创建一个空字符串
        while content.characters.count > 0{//给一个while是为了当遇到分割符跳出内循环
            if content.rangeOfString(s) == nil{//如果字符串的子串没有分割符，字符串直接输出
                arr.append(content)//
                return arr
            }else{//反之
                if content.substringToIndex(content.startIndex.advancedBy(len1)) == s{
                    //判断第一个字符串是否为分割符
                    content = content.substringFromIndex(content.startIndex.advancedBy(len1))
                    // 如果是，将第一个字串截掉
                }else{
                    for ch in content.characters{ //遍历content的字符
                        let self2 = (content as NSString).substringWithRange(NSRange(location: 0,length:len1)) as String//求出以当前字符向后长度为len1的字符串self2
                        if self2 != s{// 如果self1与s不相同
                            content = content.substringFromIndex(content.startIndex.advancedBy(1))
                            //content去掉当前字符，并给自己赋值
                            tmpStr.append(ch)//将当前字符传给空字符串tmpStr
                        }else{//如果相同
                            content = content.substringFromIndex(content.startIndex.advancedBy(len1))
                            //求出以当前字符向后长度为len1的字符串self2
                            arr.append(tmpStr)//将tmpStr添加到数组
                            tmpStr.removeAll()//清空字符串
                            break//中断，是为了跳出遍历，继续遍历新content
                        }
                    }
                }
            }
        }
        return arr//返回数组
    }
}















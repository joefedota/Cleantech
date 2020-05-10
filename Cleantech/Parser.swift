//
//  Parser.swift
//  Cleantech
//
//  Created by Joseph Fedota on 4/20/20.
//  Copyright © 2020 23O2 Automatic. All rights reserved.
//

import Foundation

class Parser : NSObject {
    static let content = "21.446510,-157.761770\n34.006419,-81.051715\n34.174435,-118.310501\n37.913293,-122.334081\n34.076375,-118.358701\n33.664754,-117.854943\n40.872954,-124.079468\n37.405251,-122.066987\n34.063173,-117.611311\n34.044465,-118.453617\n30.384515,-97.723850\n34.438161,-119.750865\n33.211677,-117.389219\n33.923810,-117.410449\n32.933608,-117.239880\n21.329921,-157.962724\n37.491169,-122.231025\n42.017847,-87.921507\n39.324920,-120.223583\n37.647880,-122.405960\n19.818750,-155.838538\n40.593489,-73.584156\n41.400668,-72.914290\n34.025295,-118.469591\n38.569408,-121.521431\n37.679620,-121.697112\n33.941453,-118.378143\n37.564842,-122.275777\n34.111928,-118.149933\n37.386498,-122.264313\n34.023945,-117.724764\n34.062192,-118.173614\n42.221001,-71.037430\n38.911340,-76.996098\n39.913356,-105.229450\n34.199996,-118.191250\n39.861574,-84.452336\n38.363638,-122.714481\n42.954902,-83.653188\n33.858572,-118.315341\n33.519859,-117.666836\n33.648745,-117.918550\n39.998139,-83.032722\n39.611621,-75.739559\n33.813280,-116.394413\n36.253164,-120.238534\n33.528973,-86.794572\n37.771229,-121.968542\n34.101360,-118.314043\n37.835094,-122.283695\n33.819510,-118.189659\n37.666872,-122.106548\n42.294615,-83.233336\n33.625374,-117.878585\n33.632806,-81.847336\n42.407211,-71.382437\n33.708339,-117.779855\n42.549221,-71.284134\n21.295443,-157.850051\n34.026184,-118.469032\n37.322449,-122.051509\n37.735448,-122.214906\n37.418799,-122.133202\n34.166944,-118.606082\n21.481786,-158.049742\n37.893794,-122.515939\n41.492448,-72.759057\n33.963207,-118.421598\n34.002082,-117.828924\n34.038891,-118.555805\n33.692038,-117.939059\n33.526553,-117.712260\n19.715187,-156.034377\n37.271963,-121.954657\n41.046113,-73.528305\n40.813419,-77.859070\n33.443309,-112.076219\n33.597167,-117.657709\n33.787500,-117.833326\n37.761040,-122.204597\n33.854010,-118.381491\n37.284285,-121.999306\n33.789124,-118.307239\n33.889393,-118.360961\n33.843571,-118.314552\n37.373278,-121.918801\n39.740840,-105.168528\n33.661574,-117.668435\n33.855878,-117.837718​"

    let parsedCSV: [[String]] = content.components(separatedBy: "\n").map{ $0.components(separatedBy: ",") }
    
    func latlongs() -> [[Double]] {
        var result : [[Double]] = []
        for pair in parsedCSV {
            let new_pair : [Double] = [(pair[0] as NSString).doubleValue, (pair[1] as NSString).doubleValue]
            result.append(new_pair)
        }
        print(result.count)
        return result
    }
}
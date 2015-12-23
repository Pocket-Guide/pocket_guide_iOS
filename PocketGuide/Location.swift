//
//  Location.swift
//  PocketGuide
//
//  Created by Seo Kyohei on 2015/12/21.
//  Copyright © 2015年 Kyohei Seo. All rights reserved.
//

import UIKit

enum PrefectureCode: Int {
    case Hokkaido, Aomori, Iwate, Miyagi, Akita, Yamagata, Hukushima, Ibaraki, Tochigi, Gunma, Saitama, Chiba, Tokyo, Kanagawa, Nigata, Toyama, Ishikawa, Fukui, Yamanashi, Nagano, Gifu, Shizuoka, Aichi, Mie, Shiga, Kyoto, Osaka, Hyogo, Nara, Wakayama, Tottori, Shimane, Okayama, Hiroshima, Yamaguchi, Tokushima, Kagawa, Ehime, Kochi, Fukuoka, Saga, Nagasaki, Kumamoto, Oita, Miyazaki, Kagoshima, Okinawa
}

class Location: NSObject {
    var prefecture: Int!
}

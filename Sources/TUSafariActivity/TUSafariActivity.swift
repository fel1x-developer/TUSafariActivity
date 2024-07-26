//
//  TUSafariActivity.h
//
//  Created by Minsoo Choo on 07/25/24.
//  Copyright (c) 2024 Minsoo Choo. All rights reserved.
//
//  Created by David Beck on 11/30/12.
//  Copyright (c) 2012 ThinkUltimate. All rights reserved.
//
//  http://github.com/davbeck/TUSafariActivity
//
//  Redistribution and use in source and binary forms, with or without modification,
//  are permitted provided that the following conditions are met:
//
//  - Redistributions of source code must retain the above copyright notice,
//    this list of conditions and the following disclaimer.
//  - Redistributions in binary form must reproduce the above copyright notice,
//    this list of conditions and the following disclaimer in the documentation
//    and/or other materials provided with the distribution.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
//  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
//  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
//  IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
//  INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
//  BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
//  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
//  LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
//  OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
//  OF THE POSSIBILITY OF SUCH DAMAGE.
//

import UIKit

public class TUSafariActivity: UIActivity {
    var url: URL?
    
    public override var activityType: UIActivity.ActivityType? {
        return UIActivity.ActivityType(rawValue: String(describing: self))
    }
    
    public override var activityTitle: String? {
        return String(localized: "Open in Safari", table: "TUSafariActivity", bundle: .module)
    }
    
    public override var activityImage: UIImage? {
        return UIImage(systemName: "safari")
    }
    
    @MainActor public override func canPerform(withActivityItems activityItems: [Any]?) -> Bool {
        for activityItem in activityItems ?? [] {
            if activityItem is URL && UIApplication.shared.canOpenURL(activityItem as! URL) {
                return true
            }
        }
        
        return false
    }
    
    public override func prepare(withActivityItems activityItems: [Any]) {
        for activityItem in activityItems ?? [] {
            if activityItem is URL {
                url = activityItem as? URL;
            }
        }
    }
    
    @MainActor public override func perform() {
        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
        activityDidFinish(true)
    }
}

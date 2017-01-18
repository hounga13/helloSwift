//
//  Copyright (c) 2016 Keun young Kim <book@meetkei.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "SmartTV.h"

@implementation SmartTV
- (void)play {
    NSLog(@"%@: call %s", NSStringFromClass([self class]), __FUNCTION__);
}

- (void)pause {
    NSLog(@"%@: call %s", NSStringFromClass([self class]), __FUNCTION__);
}

- (void)stop {
    NSLog(@"%@: call %s", NSStringFromClass([self class]), __FUNCTION__);
}

- (void)nextMedia {
    NSLog(@"%@: call %s", NSStringFromClass([self class]), __FUNCTION__);
}

- (void)prevMedia {
    NSLog(@"%@: call %s", NSStringFromClass([self class]), __FUNCTION__);
}

- (void)on {
    NSLog(@"%@: call %s", NSStringFromClass([self class]), __FUNCTION__);
}

- (void)off {
    NSLog(@"%@: call %s", NSStringFromClass([self class]), __FUNCTION__);
}

- (void)volumeUp {
    NSLog(@"%@: call %s", NSStringFromClass([self class]), __FUNCTION__);
    
    self.volume = MIN(100, ++self.volume);
    NSLog(@"%@: volume %ld", NSStringFromClass([self class]), self.volume);
}

- (void)volumeDown {
    NSLog(@"%@: call %s", NSStringFromClass([self class]), __FUNCTION__);
    
    self.volume = MAX(0, --self.volume);
    NSLog(@"%@: volume %ld", NSStringFromClass([self class]), self.volume);
}

- (void)nextChannel {
    NSLog(@"%@: call %s", NSStringFromClass([self class]), __FUNCTION__);
}

- (void)prevChannel {
    NSLog(@"%@: call %s", NSStringFromClass([self class]), __FUNCTION__);
}
@end

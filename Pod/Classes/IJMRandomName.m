// IJMRandomName.m
//
// Copyright (c) 2014 IJMRandomName
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

// Names list from http://www.gutenberg.org/ebooks/3201

#import "IJMRandomName.h"

@interface IJMRandomName()

@property (strong, nonatomic) NSArray *firstNames;
@property (strong, nonatomic) NSArray *lastNames;

@end

@implementation IJMRandomName

- (instancetype)init
{
    self = [super init];
    if (self) {
        _firstNames = [self loadFirstNames];
        _lastNames = [self loadFirstNames];
    }
    return self;
}

- (NSArray *)loadFirstNames
{
    return [self arrayFromFileWithFileName:@"firstNames" andType:@"txt"];
}

- (NSArray *)loadLastNames
{
    return [self arrayFromFileWithFileName:@"lastNames" andType:@"txt"];
}

- (NSArray *)arrayFromFileWithFileName:(NSString *)fileName andType:(NSString *)type
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:type];
    NSError *error = nil;
    NSString *content = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
    if (error) {
        NSLog(@"Error: %@", error.localizedDescription);
        return @[];
    }
    else {
        return [content componentsSeparatedByString:@"\r"];
    }
}

- (NSString *)getName
{
    return [NSString stringWithFormat:@"%@ %@",
            self.firstNames[arc4random() % [self.firstNames count]],
            self.lastNames[arc4random() % [self.lastNames count]]];
}

@end

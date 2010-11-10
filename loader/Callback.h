#include <Foundation/Foundation.h>

@interface Callback : NSObject {
	id _target;
	SEL _action;
	id _object;
}

@property (nonatomic, assign) id target;
@property (nonatomic, assign) SEL action;
@property (nonatomic, assign) id object;

- (id)initWithTarget:(id)t action:(SEL)a object:(id)o;
- (void)fire;
- (void)fireOnMainThread:(BOOL)b;

@end

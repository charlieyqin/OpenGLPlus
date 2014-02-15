#import "GLPSync.h"

@implementation GLPSync

+ (instancetype)sync
{
	return [[self alloc] init];
}

+ (GLenum)syncWithClientWait:(NSTimeInterval)timeout
{
	return [[self sync] clientWait:timeout];
}

+ (void)syncWithWait:(NSTimeInterval)timeout
{
	[[self sync] wait:timeout];
}

- (instancetype)init
{
	self = [super init];
	if(self != nil)
	{
		sync = glFenceSyncAPPLE(GL_SYNC_GPU_COMMANDS_COMPLETE_APPLE, 0);
	}
	return self;
}

- (void)dealloc
{
	if(sync != NULL)
	{
		glDeleteSyncAPPLE(sync);
	}
}

@synthesize GLSync = sync;

- (BOOL)signaled
{
	GLint value = 0;
	glGetSyncivAPPLE(sync, GL_SYNC_STATUS_APPLE, sizeof(value), NULL, &value);
	return value == GL_SIGNALED_APPLE;
}

- (GLenum)clientWait:(NSTimeInterval)timeout
{
	return glClientWaitSyncAPPLE(sync, GL_SYNC_FLUSH_COMMANDS_BIT_APPLE, timeout * NSEC_PER_SEC);
}

- (void)wait:(NSTimeInterval)timeout
{
	glWaitSyncAPPLE(sync, 0, timeout * NSEC_PER_SEC);
}

@end
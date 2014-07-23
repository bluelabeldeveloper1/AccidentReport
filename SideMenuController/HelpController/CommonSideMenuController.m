//
//  CommonSideMenuController.m
//  MemeApp
//
//  Created by macmini13 on 02/06/14.
//  Copyright (c) 2014 dunice-group. All rights reserved.
//

#import "CommonSideMenuController.h"

@implementation CommonSideMenuController

+ (void)showAlertMessage:(NSString *)message title:(NSString*)pstrTitle response:(alertActionBlock)pBlock withButtonTitles:(NSString *)strButtons, ...NS_REQUIRES_NIL_TERMINATION
{
//    Helper *objGlobal = [Helper sharedInstance];
//    objGlobal.pActionBlock = nil;
//    
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:pstrTitle
//                                                    message:message
//                                                   delegate:objGlobal
//                                          cancelButtonTitle:nil
//                                          otherButtonTitles:nil] ;
//    
//    // Variable argument list
//    va_list args;
//    va_start(args, strButtons);
//    for (NSString *arg = strButtons; arg != nil; arg = va_arg(args, NSString*))
//    {
//        [alert addButtonWithTitle:arg];
//    }
//    va_end(args);
//    objGlobal.pActionBlock = pBlock;
//    
//    
//    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
//        [alert show];
//    }];
//    
    // [alert show];
}

#pragma mark
#pragma mark Rechability
#pragma mark

+ (BOOL)isNetworkReachable
{
	[[NetConnection sharedReachability] setHostName:@"www.google.com"];
	NetworkStatus remoteHostStatus = [[NetConnection sharedReachability] internetConnectionStatus];
	
    BOOL isReachable = NO;
    
	if (remoteHostStatus == NotReachable)
		isReachable = NO;
	else if ((remoteHostStatus == ReachableViaCarrierDataNetwork || remoteHostStatus == ReachableViaWiFiNetwork))
		isReachable = YES;
    
	return isReachable;
}

+(NSString*)getStringFromDate:(NSDate*)pobjDate withFormat:(NSString*)pstrFormat
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:pstrFormat];
    NSString *stringFromDate = [formatter stringFromDate:pobjDate];
    return stringFromDate;
}

+ (NSString *) appVersion
{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey: @"CFBundleShortVersionString"];
}

+ (NSString*)hardwareString
{
    size_t size = 100;
    char *hw_machine = malloc(size);
    int name[] = {CTL_HW,HW_MACHINE};
    sysctl(name, 2, hw_machine, &size, NULL, 0);
    NSString *hardware = [NSString stringWithUTF8String:hw_machine];
    free(hw_machine);
    return hardware;
}

+ (NSString*)hardwareDescription
{
    NSString *hardware = [CommonSideMenuController hardwareString];
    if ([hardware isEqualToString:@"iPhone1,1"]) return @"iPhone 2G";
    if ([hardware isEqualToString:@"iPhone1,2"]) return @"iPhone 3G";
    if ([hardware isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS";
    if ([hardware isEqualToString:@"iPhone3,1"]) return @"iPhone 4";
    if ([hardware isEqualToString:@"iPhone3,2"]) return @"iPhone 4";
    if ([hardware isEqualToString:@"iPhone3,3"]) return @"iPhone 4 (CDMA)";
    if ([hardware isEqualToString:@"iPhone4,1"]) return @"iPhone 4S";
    if ([hardware isEqualToString:@"iPhone5,1"]) return @"iPhone 5";
    if ([hardware isEqualToString:@"iPhone5,2"]) return @"iPhone 5 (GSM+CDMA)";
    
    if ([hardware isEqualToString:@"iPod1,1"]) return @"iPod Touch (1 Gen)";
    if ([hardware isEqualToString:@"iPod2,1"]) return @"iPod Touch (2 Gen)";
    if ([hardware isEqualToString:@"iPod3,1"]) return @"iPod Touch (3 Gen)";
    if ([hardware isEqualToString:@"iPod4,1"]) return @"iPod Touch (4 Gen)";
    if ([hardware isEqualToString:@"iPod5,1"]) return @"iPod Touch (5 Gen)";
    
    if ([hardware isEqualToString:@"iPad1,1"]) return @"iPad";
    if ([hardware isEqualToString:@"iPad1,2"]) return @"iPad 3G";
    if ([hardware isEqualToString:@"iPad2,1"]) return @"iPad 2 (WiFi)";
    if ([hardware isEqualToString:@"iPad2,2"]) return @"iPad 2";
    if ([hardware isEqualToString:@"iPad2,3"]) return @"iPad 2 (CDMA)";
    if ([hardware isEqualToString:@"iPad2,4"]) return @"iPad 2";
    if ([hardware isEqualToString:@"iPad2,5"]) return @"iPad Mini (WiFi)";
    if ([hardware isEqualToString:@"iPad2,6"]) return @"iPad Mini";
    if ([hardware isEqualToString:@"iPad2,7"]) return @"iPad Mini (GSM+CDMA)";
    if ([hardware isEqualToString:@"iPad3,1"]) return @"iPad 3 (WiFi)";
    if ([hardware isEqualToString:@"iPad3,2"]) return @"iPad 3 (GSM+CDMA)";
    if ([hardware isEqualToString:@"iPad3,3"]) return @"iPad 3";
    if ([hardware isEqualToString:@"iPad3,4"]) return @"iPad 4 (WiFi)";
    if ([hardware isEqualToString:@"iPad3,5"]) return @"iPad 4";
    if ([hardware isEqualToString:@"iPad3,6"]) return @"iPad 4 (GSM+CDMA)";
    
    if ([hardware isEqualToString:@"i386"]) return @"Simulator";
    if ([hardware isEqualToString:@"x86_64"]) return @"Simulator";
    
    return hardware;
}

+(NSString *)getFreeDiskspace {
    uint64_t totalSpace = 0;
    uint64_t totalFreeSpace = 0;
    NSError *error = nil;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSDictionary *dictionary = [[NSFileManager defaultManager] attributesOfFileSystemForPath:[paths lastObject] error: &error];
    
    if (dictionary) {
        NSNumber *fileSystemSizeInBytes = [dictionary objectForKey: NSFileSystemSize];
        NSNumber *freeFileSystemSizeInBytes = [dictionary objectForKey:NSFileSystemFreeSize];
        totalSpace = [fileSystemSizeInBytes unsignedLongLongValue];
        totalFreeSpace = [freeFileSystemSizeInBytes unsignedLongLongValue];
        return [NSString stringWithFormat:@"Disk space: Free -> %llu MB; Total -> %llu MB", ((totalFreeSpace/1024ll)/1024ll), ((totalSpace/1024ll)/1024ll)];
    } else {
        NSLog(@"Error Obtaining System Memory Info: Domain = %@, Code = %d", [error domain], [error code]);
    }
    return @"";
}

+(NSString *)MemoryStatus
{
    mach_port_t host_port;
    mach_msg_type_number_t host_size;
    vm_size_t pagesize;
    
    host_port = mach_host_self();
    host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
    host_page_size(host_port, &pagesize);
    
    vm_statistics_data_t vm_stat;
    
    if (host_statistics(host_port, HOST_VM_INFO, (host_info_t)&vm_stat, &host_size) != KERN_SUCCESS) {
        NSLog(@"Failed to fetch vm statistics");
    }
    
    /* Stats in bytes */
    natural_t mem_used = (vm_stat.active_count +
                          vm_stat.inactive_count +
                          vm_stat.wire_count) * pagesize;
    natural_t mem_free = vm_stat.free_count * pagesize;
    natural_t mem_total = mem_used + mem_free;
    return [NSString stringWithFormat:@"Memory: Used -> %u MB; Free -> %u MB; Total -> %u MB", mem_used/(1024*1024), mem_free/(1024*1024), mem_total/(1024*1024)];
}


@end

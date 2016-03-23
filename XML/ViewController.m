//
//  ViewController.m
//  XML
//
//  Created by Jems001 on 22/06/15.
//  Copyright (c) 2015 Jems001. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "RXMLElement.h"
#import "SBJSON.h"
#import "JSON.h"



@interface ViewController ()<NSXMLParserDelegate>
{
    NSMutableData *webData;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
         
//    [self networking];
}

-(void)parseXML{
        // NSLog(@"%@",imgStr);

    NSString *msg = [NSString stringWithFormat:@"<UploadPhotoData><ProductName>Balance</ProductName><EventType>Spartan</EventType><email>pra@hotmail.com</email><CaptureDateTime>07/14/2015 02:51:24</CaptureDateTime><FirstName>Pra</FirstName><LastName>Ra</LastName><Zip>67777</Zip><PhotoData></PhotoData></UploadPhotoData>"];
    

    NSURL *requestURL = [NSURL URLWithString:@"http://www.organicvalleyevents.com/OVWebService/Service.asmx/UploadPhotoData"];
    NSString *messageLength = [NSString stringWithFormat:@"%lu", (unsigned long)[msg length]];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:requestURL cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:30];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody:[msg dataUsingEncoding:NSUTF8StringEncoding]];
    
    // sending the request
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:theRequest];
    operation.responseSerializer = [AFHTTPResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString *xml = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"Take the data master Yoda: %@", xml);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Bad SOAP server!. Error: %@", error.description);
    }];
    
    [[NSOperationQueue mainQueue] addOperation:operation];
}



- (void)xmlConnection {
    
    
//    NSString *soapFormat =@"<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><UploadPhotoData xmlns=\"http://tempuri.org/\"><xml><ProductName>Balance</ProductName><EventType>Spartan</EventType><email>pra@hotmail.com</email><CaptureDateTime>07/14/2015 02:51:24</CaptureDateTime><FirstName>Pra</FirstName><LastName>Ra</LastName><Zip>67777</Zip><PhotoData></PhotoData></xml></UploadPhotoData></soap:Body></soap:Envelope>";
    
    NSString *soapFormat =@"<?xml version=\"1.0\" encoding=\"UTF-8\"?><SOAP-ENV:Envelope xmlns:SOAP-ENV=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"><SOAP-ENV:Body><SignOnWithToken xmlns=\"http://schemas.ipcommerce.com/CWS/v2.0/ServiceInformation\"><identityToken>PHNhbWw6QXNzZXJ0aW9uIE1ham9yVmVyc2lvbj0iMSIgTWlub3JWZXJzaW9uPSIxIiBBc3NlcnRpb25JRD0iXzZlNDEzYzVkLWI3YTItNGY3Ny1iNmMyLTI0YjNmNmQzYjEwYyIgSXNzdWVyPSJJcGNBdXRoZW50aWNhdGlvbiIgSXNzdWVJbnN0YW50PSIyMDE1LTA5LTAyVDE5OjM5OjU2Ljk3OVoiIHhtbG5zOnNhbWw9InVybjpvYXNpczpuYW1lczp0YzpTQU1MOjEuMDphc3NlcnRpb24iPjxzYW1sOkNvbmRpdGlvbnMgTm90QmVmb3JlPSIyMDE1LTA5LTAyVDE5OjM5OjU2Ljk3OVoiIE5vdE9uT3JBZnRlcj0iMjA0NS0wOS0wMlQxOTozOTo1Ni45NzlaIj48L3NhbWw6Q29uZGl0aW9ucz48c2FtbDpBZHZpY2U+PC9zYW1sOkFkdmljZT48c2FtbDpBdHRyaWJ1dGVTdGF0ZW1lbnQ+PHNhbWw6U3ViamVjdD48c2FtbDpOYW1lSWRlbnRpZmllcj41RURBMzUwOUNBMTAwMDAxPC9zYW1sOk5hbWVJZGVudGlmaWVyPjwvc2FtbDpTdWJqZWN0PjxzYW1sOkF0dHJpYnV0ZSBBdHRyaWJ1dGVOYW1lPSJTQUsiIEF0dHJpYnV0ZU5hbWVzcGFjZT0iaHR0cDovL3NjaGVtYXMuaXBjb21tZXJjZS5jb20vSWRlbnRpdHkiPjxzYW1sOkF0dHJpYnV0ZVZhbHVlPjVFREEzNTA5Q0ExMDAwMDE8L3NhbWw6QXR0cmlidXRlVmFsdWU+PC9zYW1sOkF0dHJpYnV0ZT48c2FtbDpBdHRyaWJ1dGUgQXR0cmlidXRlTmFtZT0iU2VyaWFsIiBBdHRyaWJ1dGVOYW1lc3BhY2U9Imh0dHA6Ly9zY2hlbWFzLmlwY29tbWVyY2UuY29tL0lkZW50aXR5Ij48c2FtbDpBdHRyaWJ1dGVWYWx1ZT4zNWZlN2ZmMy1hYTU2LTRkMGEtYjk0Ny1hMDliODZhZGVlOGY8L3NhbWw6QXR0cmlidXRlVmFsdWU+PC9zYW1sOkF0dHJpYnV0ZT48c2FtbDpBdHRyaWJ1dGUgQXR0cmlidXRlTmFtZT0ibmFtZSIgQXR0cmlidXRlTmFtZXNwYWNlPSJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcyI+PHNhbWw6QXR0cmlidXRlVmFsdWU+NUVEQTM1MDlDQTEwMDAwMTwvc2FtbDpBdHRyaWJ1dGVWYWx1ZT48L3NhbWw6QXR0cmlidXRlPjwvc2FtbDpBdHRyaWJ1dGVTdGF0ZW1lbnQ+PFNpZ25hdHVyZSB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC8wOS94bWxkc2lnIyI+PFNpZ25lZEluZm8+PENhbm9uaWNhbGl6YXRpb25NZXRob2QgQWxnb3JpdGhtPSJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzEwL3htbC1leGMtYzE0biMiPjwvQ2Fub25pY2FsaXphdGlvbk1ldGhvZD48U2lnbmF0dXJlTWV0aG9kIEFsZ29yaXRobT0iaHR0cDovL3d3dy53My5vcmcvMjAwMC8wOS94bWxkc2lnI3JzYS1zaGExIj48L1NpZ25hdHVyZU1ldGhvZD48UmVmZXJlbmNlIFVSST0iI182ZTQxM2M1ZC1iN2EyLTRmNzctYjZjMi0yNGIzZjZkM2IxMGMiPjxUcmFuc2Zvcm1zPjxUcmFuc2Zvcm0gQWxnb3JpdGhtPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwLzA5L3htbGRzaWcjZW52ZWxvcGVkLXNpZ25hdHVyZSI+PC9UcmFuc2Zvcm0+PFRyYW5zZm9ybSBBbGdvcml0aG09Imh0dHA6Ly93d3cudzMub3JnLzIwMDEvMTAveG1sLWV4Yy1jMTRuIyI+PC9UcmFuc2Zvcm0+PC9UcmFuc2Zvcm1zPjxEaWdlc3RNZXRob2QgQWxnb3JpdGhtPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwLzA5L3htbGRzaWcjc2hhMSI+PC9EaWdlc3RNZXRob2Q+PERpZ2VzdFZhbHVlPmFqN2kzMzZsbXBJcDhhU3pqUmlyajZrcWI0dz08L0RpZ2VzdFZhbHVlPjwvUmVmZXJlbmNlPjwvU2lnbmVkSW5mbz48U2lnbmF0dXJlVmFsdWU+azYvenAzcmJyYVRSelVyQTNNRThvSWFxNEM2UlZybk9SK2l2MWhNQURTdmhBei91VUVRclZzRXBDbHFxQk1peDM4Umx4VGZQRkJuYUZ3Y1lxSkFpNUY3eFY0OWsySkRFeVA0eXJFYkNFS2VMNDlHTGUyMlFTZU81aDNjN3VhTFJOd1Q4ZmdHa2Z4cCt4ckErS3ludmlua0ZoQzdDc2dySTRmbEY5K055d0JLbkkyK1pWN25kSVpPQlZYTmp1OXJBTVdlc3REaDNMNER2dktCQnIwZkpvUHNyMXBOYjZzeUErOUhzWDdUWU54dHI4OFJzK1hhVFc4M3VjM1EveXlFcndQSkRlME8vQkRVWG1wN3dXYUVEdUlZaUVHRFlxY01yc2NHYWRzMXdLSWVLZ3VxUDJGMEEyNEdhMXdWWGllZkp0cjExTERuc3h0aWFXVWJCV0oxSmhRPT08L1NpZ25hdHVyZVZhbHVlPjxLZXlJbmZvPjxvOlNlY3VyaXR5VG9rZW5SZWZlcmVuY2UgeG1sbnM6bz0iaHR0cDovL2RvY3Mub2FzaXMtb3Blbi5vcmcvd3NzLzIwMDQvMDEvb2FzaXMtMjAwNDAxLXdzcy13c3NlY3VyaXR5LXNlY2V4dC0xLjAueHNkIj48bzpLZXlJZGVudGlmaWVyIFZhbHVlVHlwZT0iaHR0cDovL2RvY3Mub2FzaXMtb3Blbi5vcmcvd3NzL29hc2lzLXdzcy1zb2FwLW1lc3NhZ2Utc2VjdXJpdHktMS4xI1RodW1icHJpbnRTSEExIj5ZREJlRFNGM0Z4R2dmd3pSLzBwck11OTZoQ2M9PC9vOktleUlkZW50aWZpZXI+PC9vOlNlY3VyaXR5VG9rZW5SZWZlcmVuY2U+PC9LZXlJbmZvPjwvU2lnbmF0dXJlPjwvc2FtbDpBc3NlcnRpb24+</identityToken></SignOnWithToken></SOAP-ENV:Body></SOAP-ENV:Envelope>";
    
    NSLog(@"The request format is %@",soapFormat);
    
    NSURL *locationOfWebService = [NSURL URLWithString:@"http://api.cert.nabcommerce.com"];
    
    NSLog(@"web url = %@",locationOfWebService);
    
    NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc]initWithURL:locationOfWebService];
    
    NSString *msgLength = [NSString stringWithFormat:@"%lu",(unsigned long)[soapFormat length]];
    //  /2.0.18/SvcInfo HTTP/1.0
    
//    [theRequest addValue:@"/2.0.18/SvcInfo HTTP/1.0" forHTTPHeaderField:@"POST"];
    [theRequest addValue:@"api.cert.nabcommerce.com" forHTTPHeaderField:@"Host"];
    [theRequest addValue:@"text/xml; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    [theRequest addValue:@"http://schemas.ipcommerce.com/CWS/v2.0/ServiceInformation/ICWSServiceInformation/SignOnWithToken" forHTTPHeaderField:@"SOAPAction"];
    [theRequest addValue:msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPShouldHandleCookies:YES];
    [theRequest setHTTPShouldUsePipelining:YES];
    [theRequest setHTTPBody:[soapFormat dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLConnection *connect = [[NSURLConnection alloc]initWithRequest:theRequest delegate:self];
    
    if (connect) {
        webData = [[NSMutableData alloc]init];

        NSLog(@"Connection established");
    }
    else {
        NSLog(@"No Connection established");
    }
}


-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [webData setLength: 0];
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [webData appendData:data];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"DONE. Received Bytes: %lu", (unsigned long)[webData length]);
    NSString *theXML = [[NSString alloc] initWithBytes: [webData mutableBytes] length:[webData length] encoding:NSUTF8StringEncoding];
    
    NSData *osman = [theXML dataUsingEncoding:NSUTF8StringEncoding];
    
    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:osman];
    
    // Don't forget to set the delegate!
    xmlParser.delegate = self;
    
    // Run the parser
    BOOL parsingResult = [xmlParser parse];

}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"ERROR with theConenction");
    
}

- (void)networking {
    NSString *value = [NSString stringWithFormat:@"<login><username>bradley.s.morris@gmail.com.dev</username><password>!test!dev1</password><security_token>6jts3ars5Z72fO41IcyMr6jnA</security_token></login>"];

    NSString *authenticationURL = @"https://cs18.salesforce.com/services";
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:authenticationURL]];
    NSString *message = [value stringByReplacingOccurrencesOfString:@"[\\\"" withString:@""];
    [request setHTTPMethod: @"POST"];
    [request setValue:@"application/xml" forHTTPHeaderField:@"content-type"];
    [request setHTTPBody:[[NSString stringWithFormat:@"%@",message] dataUsingEncoding:NSUTF8StringEncoding]];
    request.HTTPBody = [[NSString stringWithFormat:@"%@",message] dataUsingEncoding:NSUTF8StringEncoding];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
    AFHTTPRequestOperation *operation = [manager HTTPRequestOperationWithRequest:request success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [[[UIAlertView alloc]initWithTitle:@"Success" message:operation.responseObject delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [[[UIAlertView alloc]initWithTitle:@"Failure" message:error.description delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
    }];
    
    [manager.operationQueue addOperation:operation];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

// bq803xx rom api

typedef struct {
  unsigned char total[6];
} Accum;

typedef int (*iRootFuncPtr)(unsigned int x, void *coeff);

void accumulate(Accum *accum, double val);
double exp(double d);
double log(double f);
int AB_div_C(int a, int b, int c);
int abs_int(int In);
int round(double x);
long abs_long(long li);
unsigned int calculate_percent(unsigned int x, unsigned int max);
unsigned int calculate_percent_of(unsigned int p, unsigned int max);
unsigned int unsigned_AB_div_C(unsigned int a, unsigned int b, unsigned int c);
unsigned int iRoot(iRootFuncPtr func, unsigned int x1, unsigned int x2, int eq_val, void *ptr);

int smbCheckPecSlave(void);
int smbMasterRdBlock(unsigned char address, unsigned char command, unsigned char *byte_cnt, unsigned char *block);
int smbMasterRdWord(unsigned char address, unsigned char command, int *data);
int smbMasterWrBlock(unsigned char address, unsigned char command, unsigned char byte_cnt, unsigned char *block);
int smbMasterWrWord(unsigned char address, unsigned char command, int data);
int smbSlaveBlock(unsigned char *datardy, unsigned char *byte_cnt, unsigned char max_cnt, unsigned char *block);
int smbSlaveCmd(unsigned char cmd, unsigned char size, unsigned *table() );
int smbSlaveRcvBlock(unsigned char *byte_cnt, unsigned char *block);
int smbSlaveRcvWord(int*data);
int smbSlaveSndBlock(unsigned char byte_cnt, unsigned char *block);
int smbSlaveSndBlockNoWait(unsigned char byte_cnt, unsigned char *block);
int smbSlaveSndWord(int data);
int smbSlaveSndWordNoWait(int data);
int smbSlaveWord(unsigned char *datardy, int *data);
int smbWaitBusFree(char status);
void smb_ACK(void);
void smb_NACK(void);
void smb_SetBFI(void);

void FdataEraseRow(unsigned char xadr);
void FdataMassErase(void);
void FdataProgRow(unsigned char xadr, unsigned char yadr, unsigned char cnt, unsigned char *data);
void FdataProgWord(unsigned char *addr, unsigned char data);

void FlashEraseRow(unsigned int xadr);
void FlashProgRow(unsigned int xadr, unsigned char yadr,unsigned char cnt, int *data);
void FlashRdRow(unsigned int xadr, unsigned char yadr,unsigned char cnt, int *data);
long FlashChecksum();

unsigned char I2CCompareBlock(unsigned char addr, unsigned char cmd, unsigned char cnt, unsigned char *data);
unsigned char I2CDeviceAval(unsigned char addr, unsigned int wait);
unsigned char I2CReadBlock(unsigned char addr, unsigned char cmd, unsigned char cnt, unsigned char *data);
unsigned char I2CWriteBlock(unsigned char addr, unsigned char cmd, unsigned char cnt, unsigned char *data);

void sha1_mac(const unsigned char *AuthKey, unsigned long *sha1_digest);

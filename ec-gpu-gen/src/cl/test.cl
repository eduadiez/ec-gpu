//KERNEL void test_add_32(Scalar32 a, Scalar32 b, GLOBAL Scalar32 *result) {
//  *result = Scalar32_add(a, b);
//}
//
//KERNEL void test_mul_32(Scalar32 a, Scalar32 b, GLOBAL Scalar32 *result) {
//  *result = Scalar32_mul(a, b);
//}
//
//KERNEL void test_sub_32(Scalar32 a, Scalar32 b, GLOBAL Scalar32 *result) {
//  *result = Scalar32_sub(a, b);
//}
//
//KERNEL void test_pow_32(Scalar32 a, uint b, GLOBAL Scalar32 *result) {
//  *result = Scalar32_pow(a, b);
//}
//
//KERNEL void test_mont_32(Scalar32 a, GLOBAL Scalar32 *result) {
//  *result = Scalar32_mont(a);
//}
//
//KERNEL void test_unmont_32(Scalar32 a, GLOBAL Scalar32 *result) {
//  *result = Scalar32_unmont(a);
//}
//
//KERNEL void test_sqr_32(Scalar32 a, GLOBAL Scalar32 *result) {
//  *result = Scalar32_sqr(a);
//}


#define FIELD_LIMBS 8;
#define FIELD_LIMB_BITS 32;

// Left-shift the limbs by one bit and subtract by modulus in case of overflow.
// Faster version of FIELD_add(a, a)
DEVICE Scalar32 vmx_double(Scalar32 a) {
    //a.val[7] = (a.val[7] << 1) | (a.val[7 - 1] >> 31);
    //a.val[7] = ((a.val[7] << 1) | (a.val[6] >> 31));
    //a.val[7] = (a.val[7] << 1);
    //a.val[7] = (a.val[7 - 1] >> 31);
    //a.val[7] = (a.val[7] << 1) | 0;
    a.val[7] = (a.val[7] << 1) | (a.val[6] >> 31);
    //a.val[0] = (a.val[6] >> 31);
    a.val[0] = 0;
    a.val[1] = 0;
    a.val[2] = 0;
    a.val[3] = 0;
    a.val[4] = 0;
    a.val[5] = 0;
    a.val[6] = 0;
    //a.val[7] = 0;
/*
  for(uchar i = 7; i >= 1; i--) {
    a.val[i] = (a.val[i] << 1) | (a.val[i - 1] >> 31);
    }
    */
  //a.val[0] <<= 1;
  //if(FIELD_gte(a, FIELD_P)) a = FIELD_sub_(a, FIELD_P);
  /*
  if(FIELD_gte(a, FIELD_P)) {
    a.val[0] = 123;
    a.val[1] = 0;
    a.val[2] = 0;
    a.val[3] = 0;
    a.val[4] = 0;
    a.val[5] = 0;
    a.val[6] = 0;
    a.val[7] = 0;
  }
  else {
    a.val[0] = 555;
    a.val[1] = 0;
    a.val[2] = 0;
    a.val[3] = 0;
    a.val[4] = 0;
    a.val[5] = 0;
    a.val[6] = 0;
    a.val[7] = 0;
  };
  */
  return a;
}

KERNEL void test_double_32(Scalar32 a, GLOBAL Scalar32 *result) {
  //*result = Scalar32_double(a);
  *result = vmx_double(a);
}

//////////////
//
//KERNEL void test_add_64(Scalar64 a, Scalar64 b, GLOBAL Scalar64 *result) {
//  *result = Scalar64_add(a, b);
//}
//
//KERNEL void test_mul_64(Scalar64 a, Scalar64 b, GLOBAL Scalar64 *result) {
//  *result = Scalar64_mul(a, b);
//}
//
//KERNEL void test_sub_64(Scalar64 a, Scalar64 b, GLOBAL Scalar64 *result) {
//  *result = Scalar64_sub(a, b);
//}
//
//KERNEL void test_pow_64(Scalar64 a, uint b, GLOBAL Scalar64 *result) {
//  *result = Scalar64_pow(a, b);
//}
//
//KERNEL void test_mont_64(Scalar64 a, GLOBAL Scalar64 *result) {
//  *result = Scalar64_mont(a);
//}
//
//KERNEL void test_unmont_64(Scalar64 a, GLOBAL Scalar64 *result) {
//  *result = Scalar64_unmont(a);
//}
//
//KERNEL void test_sqr_64(Scalar64 a, GLOBAL Scalar64 *result) {
//  *result = Scalar64_sqr(a);
//}
//
//KERNEL void test_double_64(Scalar64 a, GLOBAL Scalar64 *result) {
//  *result = Scalar64_double(a);
//}

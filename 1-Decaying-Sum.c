#include <stdio.h>
#include <stdint.h>


uint32_t decaying_sum(uint16_t* values, uint16_t length, uint16_t decay){
  if (length <= 0){
    return 0;
  }
  uint32_t rest = decaying_sum(&values[1], length-1, decay);
  uint32_t decayed = rest / decay;
  return values[0] + decayed;
}

uint32_t decaying_sum_inner(uint16_t* values, uint16_t length, uint16_t decay, uint32_t acc) {
  if (length <= 0){
    return acc / decay;
  }
  uint32_t decayed = acc / decay;
  return decaying_sum_inner(&values[1], length-1, decay, values[0] + decayed); 
}

uint32_t decaying_sum_tail(uint16_t* values, uint16_t length, uint16_t decay) {
  decaying_sum_inner(values, length, decay, 0);
}

int main(void) {
  uint16_t test_array[4] = { 2, 4, 6, 8 };
  printf("orig %d \n", decaying_sum(test_array, 4, 2));
  printf("tail %d \n", decaying_sum_tail(test_array, 4, 2));
  return 0;
}

cmake_minimum_required(VERSION 3.10)
project(ECDSA_ECDH_C25519)

# Defina o compilador
set(CMAKE_C_COMPILER arm-none-eabi-gcc)
set(CMAKE_CXX_COMPILER arm-none-eabi-g++)

# Defina as opções de compilação
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -mcpu=cortex-m4 -mthumb -O2")

# Adicione o diretório da biblioteca GMP compilada
include_directories(/usr/local/arm-gmp/include)
link_directories(/usr/local/arm-gmp/lib)

# Adicione os arquivos fonte
add_executable(ECDSA_ECDH_C25519 ECDSA_ECDH_C25519.cpp /home/iagolucas/Documents/Defesa_Mestrado/syscalls.c)

# Link com a biblioteca GMP
target_link_libraries(ECDSA_ECDH_C25519 gmp)

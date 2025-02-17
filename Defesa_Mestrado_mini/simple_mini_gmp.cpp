#include <iostream>
#include <fstream>
#include <gmp.h>

using namespace std;

int main() {
    // Inicializar variáveis mpz_t
    mpz_t random_number, cube_result;
    mpz_init(random_number);
    mpz_init(cube_result);

    // Gerar um número aleatório usando /dev/urandom
    ifstream urandom("/dev/urandom", ios::in | ios::binary);
    if (!urandom) {
        cerr << "Erro ao abrir /dev/urandom" << endl;
        return 1;
    }

    unsigned char buffer[16];
    urandom.read(reinterpret_cast<char*>(buffer), sizeof(buffer));
    urandom.close();

    // Converter o buffer para um número grande
    mpz_import(random_number, sizeof(buffer), 1, sizeof(buffer[0]), 0, 0, buffer);

    // Calcular o cubo do número aleatório
    mpz_pow_ui(cube_result, random_number, 3);

    // Converter os números para strings
    char random_number_str[1024];
    char cube_result_str[1024];
    mpz_get_str(random_number_str, 10, random_number);
    mpz_get_str(cube_result_str, 10, cube_result);

    // Mostrar o resultado
    cout << "Número aleatório: " << random_number_str << endl;
    cout << "Cubo do número: " << cube_result_str << endl;

    // Limpar variáveis mpz_t
    mpz_clear(random_number);
    mpz_clear(cube_result);

    return 0;
}
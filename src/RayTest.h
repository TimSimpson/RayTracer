#include <iostream>
#include <boost/format.hpp>

void tests();

int failures = 0;

int main()
{
    try
    {
        tests();
        std::cerr << failures << " failure(s)";
        if (failures > 0)
        {
            return -1;
        }
        return 0;
    }
    catch(...)
    {
        std::cerr << "Something bad went down in test land.";
        return -1;
    }

}

template<typename T1, typename T2>
void RayAssertEqual(T1 a, T2 b, const char * fileName, const int line)
{
    if (a != b)
    {
        std::cerr << "**********************************************************************" << std::endl;
        std::cerr << fileName << ":" << line << ": ";
        std::string msg = str(boost::format("FAILURE! %s != %s") % a % b);
        std::cerr << msg << std::endl;
        std::cerr << "**********************************************************************" << std::endl;
        failures ++;
    }
}

#define RAY_ASSERT_EQUAL(A, B) \
    RayAssertEqual(A, B, __FILE__, __LINE__)

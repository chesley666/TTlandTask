// SPDX-License-Identifier: MIT

pragma solidity ^0.8.21;

contract InsertSort {
    uint[] private m_uintArr;

    function insertSort() public {
        for (uint i = 1; i < m_uintArr.length; i++) {
            uint j = i; //为什么用j= i-1的方式不行： 因为uint类型 0-1就溢出啦！！！
            uint value = m_uintArr[i];
            while (j >= 1 && m_uintArr[j - 1] > value) {
                m_uintArr[j] = m_uintArr[j - 1];
                j--;
            }
            m_uintArr[j] = value;
        }
    }

    // function insertSort2 () public  {
    //     for(uint i=1; i<m_uintArr.length; i++){
    //         uint j = i-1; //j= i-1 无符号整形，溢出
    //         uint value = m_uintArr[i];
    //         while(j>=0 && m_uintArr[j]>value){
    //             m_uintArr[j+1] = m_uintArr[j];
    //             j--;
    //         }
    //         m_uintArr[j+1] = value;
    //     }
    // }

    function input(uint[] memory _arr) public {
        m_uintArr = _arr;
    }

    function showArr() public view returns (uint[] memory) {
        return m_uintArr;
    }
}

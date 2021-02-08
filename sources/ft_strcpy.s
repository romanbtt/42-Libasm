;* ************************************************************************** */
;*                                                                            */
;*                                                        :::      ::::::::   */
;*   ft_strcpy.s                                        :+:      :+:    :+:   */
;*                                                    +:+ +:+         +:+     */
;*   By: romanbtt <marvin@student.42sp.org.br>      +#+  +:+       +#+        */
;*                                                +#+#+#+#+#+   +#+           */
;*   Created: 2021/02/03 19:01:18 by romanbtt          #+#    #+#             */
;*   Updated: 2021/02/04 13:31:51 by romanbtt         ###   ########.fr       */
;*                                                                            */
;* ************************************************************************** */

; rcx is set to 0 with xor. xor 0101 0101 = 0000.
; xor is used instead of mov because it takes less time and memory to execute.
; Then we compare one byte of the pointer rsi (2nd parameter : src) +
; rcx (index) with 0 (null char).
; If the byte is equal to 0, we call the return procedure to return
; rdi + a final 0 (dest + \0).
; If it is not equal, we copy rsi + rcx (src + index) inside dh (register 1 b).
; Then we copy back dh (register 1 byte) inside rdi + rcx (dest + index).
; We increment rcx by one.
; And loop on the same procedure until 0 is found.

global ft_strcpy

ft_strcpy:
	xor rcx, rcx

until_0:
	cmp byte [rsi+rcx], 0
	je return
	mov dh, [rsi+rcx]
	mov [rdi+rcx], dh
	inc rcx
	jmp until_0

return:
	mov byte [rdi+rcx], 0
	mov rax, rdi
	ret

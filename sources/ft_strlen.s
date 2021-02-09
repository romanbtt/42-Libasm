;* ************************************************************************** */
;*                                                                            */
;*                                                        :::      ::::::::   */
;*   ft_strlen.s                                        :+:      :+:    :+:   */
;*                                                    +:+ +:+         +:+     */
;*   By: romanbtt <marvin@student.42sp.org.br>      +#+  +:+       +#+        */
;*                                                +#+#+#+#+#+   +#+           */
;*   Created: 2021/02/03 18:59:43 by romanbtt          #+#    #+#             */
;*   Updated: 2021/02/05 19:01:51 by romanbtt         ###   ########.fr       */
;*                                                                            */
;* ************************************************************************** */

; rcx is set to 0 with xor. xor 0101 0101 = 0000.
; xor is used instead of mov because it takes less time and memory to execute.
; Then we compare one byte of the pointer rdi (1st parameter) + rcx (index)
; with 0 (null char).
; If the byte is equal to 0, we call the return procedure to return
; rcx (index, nb of char).
; If it is not equal, we increment rcx (index).
; And loop on the same procedure until 0 is found.

global ft_strlen

ft_strlen:
	xor rcx, rcx

until_0:
	cmp byte [rdi+rcx], 0
	je return
	inc rcx
	jmp until_0

return:
	mov rax, rcx
	ret


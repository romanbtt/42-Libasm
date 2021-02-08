;* ************************************************************************** */
;*                                                                            */
;*                                                        :::      ::::::::   */
;*   ft_strcmp.s                                        :+:      :+:    :+:   */
;*                                                    +:+ +:+         +:+     */
;*   By: romanbtt <marvin@student.42sp.org.br>      +#+  +:+       +#+        */
;*                                                +#+#+#+#+#+   +#+           */
;*   Created: 2021/02/04 14:41:10 by romanbtt          #+#    #+#             */
;*   Updated: 2021/02/07 21:04:03 by romanbtt         ###   ########.fr       */
;*                                                                            */
;* ************************************************************************** */

; rcx, rdx, rax are set to 0 witl xor. xor 0101 0101 = 0000.
; xor is used instead of mov because it takes less time and memory to execute.
; We move rdi + rcx (1st param + index) and rsi + rcx (2nd param + index) in
; al and dl (1st byte of rax and rdx).
; Then we execute a Test operator (It's a And but without modify rax).
; If the result is 0 (mean that one or the other is equal to 0), we call
; the return procedure. In this case the flag 0 switch to 1.
; If not, we compare al and dl, if they are not equal, we call the return
; procedure. If they are equal, we increment rcx (index) and loop over compare.
; When the return procedure is reached, we substract rdx to rax and store the
; result in rax. Then we return it.

global ft_strcmp

ft_strcmp:
	xor rcx, rcx
	xor rdx, rdx
	xor rax, rax

compare:
	mov al, byte [rdi+rcx]
	mov dl, byte [rsi+rcx]
	test al, dl
	jz return
	cmp al, dl
	jne return
	inc rcx
	jmp compare

return:
	sub rax, rdx
	ret

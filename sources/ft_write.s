;* ************************************************************************** */
;*                                                                            */
;*                                                        :::      ::::::::   */
;*   ft_write.s                                         :+:      :+:    :+:   */
;*                                                    +:+ +:+         +:+     */
;*   By: romanbtt <marvin@student.42sp.org.br>      +#+  +:+       +#+        */
;*                                                +#+#+#+#+#+   +#+           */
;*   Created: 2021/02/05 14:41:10 by romanbtt          #+#    #+#             */
;*   Updated: 2021/02/06 15:53:28 by romanbtt         ###   ########.fr       */
;*                                                                            */
;* ************************************************************************** */

; We move 1 into rax (syscall of write), the others parameters of ft_write
; (fd, str, size) are already in the registers appropriate. (rdi, rsi, rdx).
; Then we do a syscall to run the system call.
; We compare the return of write to 0. If it is less than 0, it means that
; write return an error.
; In this case, we call the error procedure to set errno properly.
; We inverse rax, since we need to set errno with a positive value.
; We move rax into rdi to save the value of rax.
; We call __errno_location, it will return a pointer on errno. It'll be set in
; the rax register.
; We mov the rdi vale (error), into the variable pointed by to rax. (errno).
; Then we return rax.

global ft_write

extern __errno_location

ft_write:
	mov rax, 1
	syscall
	cmp rax, 0
	jl error
	ret

error:
	neg rax
	mov rdi, rax
	call __errno_location
	mov [rax], rdi
	mov rax, -1
	ret

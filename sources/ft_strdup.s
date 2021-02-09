;* ************************************************************************** */
;*                                                                            */
;*                                                        :::      ::::::::   */
;*   ft_strdup.s                                        :+:      :+:    :+:   */
;*                                                    +:+ +:+         +:+     */
;*   By: romanbtt <marvin@student.42sp.org.br>      +#+  +:+       +#+        */
;*                                                +#+#+#+#+#+   +#+           */
;*   Created: 2021/02/08 21:22:30 by romanbtt          #+#    #+#             */
;*   Updated: 2021/02/09 15:53:28 by romanbtt         ###   ########.fr       */
;*                                                                            */
;* ************************************************************************** */

; We first call our ft_strlen to get the lenght of the src string (rdi).
; We don't need to move the register before since the string is already in rdi.
; We increment the return of ft_strlen (rax) by one to add the \0 final.
; We move the string inside a buffer (rbx) to save it in order to use it later.
; We move the lenght of our string (rax) in rdi and call malloc with this
; argument to reserve some memory.
; We compare the return of malloc, if it is 0, we call the error procedure.
; If not, we mov the pointer rax in rdi. Now rdi point to some memory allocated
; by malloc.
; We move back rbx (temp buffer) in rsi (src string).
; Finally we call ft_strcpy to copy rsi in rdi and return rax.
; In the error procedure :
; We inverse rax, since we need to set errno with a positive value.
; We move rax into rdi to save the value of rax.
; We call __errno_location, it will return a pointer on errno. It'll be set in
; the rax register.
; We mov the rdi vale (error), into the variable pointed by to rax. (errno).

global ft_strdup

extern ft_strlen
extern malloc
extern ft_strcpy
extern __errno_location

ft_strdup:
	call ft_strlen
	inc rax
	mov rbx, rdi
	mov rdi, rax
	call malloc
	cmp rax, 0
	je error
	mov rdi, rax
	mov rsi, rbx
	call ft_strcpy
	ret
	
error:
	neg rax
	mov rdi, rax
	call __errno_location
	mov [rax], rdi
	mov rax, -1
	ret

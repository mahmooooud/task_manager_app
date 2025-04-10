import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class CustomTextFormField extends StatelessWidget {
  final TextInputType inputType;
  final bool obscureText;
  TextEditingController? controller;
  final bool isHiddenPassword;
  final String obscuringCharacter;
  final String hint;
  final String label;
  final String? helperText;
  final String? initialValue;
  final String? prefixText;
  final Color? filledColor;
  bool enable;
  bool? readOnly;
  final Function()? onTap;
  final FloatingLabelBehavior floatingLabelBehavior;
  final InputDecoration? decoration;
  final Function(String?) onSave;
  final Function(String?)? onChange;
  final Function(String?)? nextFocus;
  final Function()? onActionTap;
  final Function()? onTapShowHidePassword;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  TextInputAction? textInputAction;
  int maxLines;
  int? maxLength;
  Widget? suffixIcon;
  Widget? prefixIcon;
  List<TextInputFormatter>? inputFormatters;
  final TextStyle? labelTextStyle;
  CustomTextFormField(
      {Key? key,
      required this.hint,
      required this.onSave,
      required this.inputType,
      required this.label,
        this.helperText,
        this.readOnly,
        this.prefixText,
      this.onChange,
      this.onActionTap,
      this.nextFocus,
      this.validator,
      this.controller,
      this.obscureText = false,
      this.floatingLabelBehavior = FloatingLabelBehavior.auto,
      this.filledColor,
      this.maxLength,
      this.decoration,
      this.focusNode,
      this.maxLines = 1,
      this.isHiddenPassword = false,
      this.obscuringCharacter = " ",
      this.inputFormatters,
      this.enable = true,
      this.onTap,
      this.onTapShowHidePassword,
      this.textInputAction,
      this.suffixIcon,
      this.prefixIcon,
        this.initialValue,
      this.labelTextStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormField(
        validator: validator,
        builder: (FormFieldState<dynamic> field) {
          return Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    readOnly:readOnly??false ,
                    initialValue: initialValue,
                    controller: controller,
                    validator: validator == null? null : (e) {
                      if (controller?.text.isNotEmpty ?? false)
                        return null;
                      else
                        return "";
                    },
                    onSaved: onSave,
                    onChanged: onChange,
                    cursorColor: Theme.of(context).colorScheme.primary,
                    showCursor: true,
                    onEditingComplete: onActionTap,
                    onTap: onTap,
                    enabled: enable,
                    textAlign: TextAlign.start,
                    keyboardType: inputType,
                    maxLines: maxLines,
                    minLines: maxLines >= 1 ? maxLines : 1,
                    focusNode: focusNode,
                    inputFormatters: inputFormatters ?? [],
                    textAlignVertical: TextAlignVertical.center,
                    autovalidateMode: AutovalidateMode.disabled,
                    obscureText: obscureText && isHiddenPassword,
                    obscuringCharacter: obscuringCharacter,
                    textInputAction: textInputAction,
                    onFieldSubmitted: nextFocus,
                    maxLength: maxLength,
                    decoration: decoration ??
                        InputDecoration(
                          hintText: hint,

                          // labelText:  hint,
                          helperText:helperText ,
                          prefixText: prefixText,
                          errorStyle: TextStyle(height: 0.1, fontSize: 1),

                          alignLabelWithHint: true,
                          floatingLabelBehavior: floatingLabelBehavior,
                          border: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(
                                color: filledColor != null
                                    ? filledColor!
                                    : Color(0xffD8D8D8),
                                width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(
                                color: filledColor != null
                                    ? filledColor!
                                    : Color(0xffD8D8D8),
                                width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(
                                color: filledColor != null
                                    ? filledColor!
                                    : Color(0xffD8D8D8),
                                width: 1),
                          ),
                          errorBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(color: Color(0xffEB5959), width: 1),
                          ),
                          focusedErrorBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(color: Color(0xffEB5959), width: 1),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(
                                color: filledColor != null
                                    ? filledColor!
                                    : Color(0xffD8D8D8),
                                width: 1),
                          ),
                          fillColor: filledColor ?? Colors.white,

                          filled: true,
                          contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 14),
                          prefixIcon: prefixIcon,
                          suffixIcon: obscureText
                              ? GestureDetector(
                                  onTap: onTapShowHidePassword,
                                  child: isHiddenPassword
                                      ? const Icon(
                                          Icons.visibility_off_outlined,
                                          size: 24,
                                          color: Color(0xff808080),
                                        )
                                      : const Icon(
                                          Icons.visibility_outlined,
                                          size: 24,
                                          color: Color(0xff808080),
                                        )) //AppSVGAssets.getWidget(AppSVGAssets.showPassword))
                              : suffixIcon,
                        ),
                  ),
                  if (field.hasError && maxLength == null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        field.errorText?.toString() ?? "Field is required",
                        style: const TextStyle(color: Colors.red),
                      ),
                    )
                ],
              ),
              if (field.hasError && maxLength != null)
                PositionedDirectional(
                  bottom: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      field.errorText?.toString() ?? "Field is required",
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                )
            ],
          );
        });
  }
}

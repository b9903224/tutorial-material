function Image_inv = swapStructField(Image_inv, field_1, field_2)

temp = Image_inv.(field_2);

%%
Image_inv.(field_2) = Image_inv.(field_1);
Image_inf.(field_1) = temp;

end
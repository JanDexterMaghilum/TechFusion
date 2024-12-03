import React from 'react';
import { View, Text, TouchableOpacity } from 'react-native';
import Icon from 'react-native-vector-icons/Ionicons';
import { createStackNavigator } from '@react-navigation/stack';
import ChangePassword from './ChangePassword';

const Stack = createStackNavigator();

function SettingsStack() {
  return (
    <Stack.Navigator>
      <Stack.Screen name="Settings" component={Settings} />
      <Stack.Screen name="ChangePassword" component={ChangePassword} />
    </Stack.Navigator>
  );
}

const Settings = ({ navigation }) => {
  return (
    <View>
      // ... other settings options ...
      
      <TouchableOpacity 
        onPress={() => navigation.navigate('ChangePassword')}
        style={styles.menuItem}>
        <View style={styles.menuItemContent}>
          <Icon name="lock" size={24} color="#666" />
          <Text style={styles.menuItemText}>CHANGE PASSWORD</Text>
        </View>
        <Icon name="chevron-right" size={24} color="#666" />
      </TouchableOpacity>

      // ... other settings options ...
    </View>
  );
};

export default Settings; 